class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.attachment :file
      t.string :file_path

      t.timestamps
    end
  end
end
