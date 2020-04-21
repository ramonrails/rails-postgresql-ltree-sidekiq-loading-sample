# frozen_string_literal: true

class LtreeWorker
  include Sidekiq::Worker

  # INFO: no need to accept any argument, this process will query and run (more efficient)
  def perform
    LtreeFile.fresh.ready_to_parse.each(&:parse)
  end
end