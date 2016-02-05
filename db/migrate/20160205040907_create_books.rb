class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :country
      t.string :language
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
