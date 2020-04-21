class CreateLtreeFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :ltree_files do |t|
      t.string :name
      t.datetime :process_at
      t.boolean :done, default: false
      t.ltree :path

      t.timestamps
    end
    add_index :ltree_files, :name
    add_index :ltree_files, :process_at
    add_index :ltree_files, :done
    add_index :ltree_files, :path, using: :gist
  end
end
