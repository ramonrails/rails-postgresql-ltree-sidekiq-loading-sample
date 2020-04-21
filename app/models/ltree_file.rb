class LtreeFile < ApplicationRecord
  # define the path column as postgresql ltree
  ltree :path

  # define the attachment
  has_one_attached :uploaded_file

  # before saving, parse the time when we need to load this file
  before_create :pre_create
  after_save :post_save

  # when not touched, it is fresh
  # we will touch the timestamp to mark the process done
  scope :fresh, -> { where(done: false) }

  # is this already due for load?
  scope :ready_to_parse, -> { where("process_at < ?", DateTime.current) }

  # was this data parsed into LTREE already?
  def parsed?
    # we touch the record to mark the loading complete
    done
  end

  # actual method that loads the data into LTREE
  def parse
    # don't do anything when we do not have file
    return if done || !uploaded_file.attached?

    # mark as processed
    self.update_attribute(:done, true)

    # fetch the data in memory as array
    rows = uploaded_file.download.split("\n")
    return if rows.blank?

    # process now
    # for each row read into the array
    rows.each do |row|
      # create a record for every row of array
      LtreeFile.create(path: row)
    end
  end

  private

    def pre_create
      # we will either get some date when we should process
      # or, we get nil value
      # past dates will work too
      #
      # when we cannot get a proper date, assume "now"
      self.process_at = Chronic.parse(name) || DateTime.current
    end

    # once saved, it will trigger sidekiq action scheduled at specific time
    # `now` is also scheduled
    def post_save
      LtreeWorker.perform_at(process_at)
    end
end
