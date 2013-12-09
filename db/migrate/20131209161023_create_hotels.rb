class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.float :rating
      t.boolean :breakfast
      t.text :description
      t.string :room_price

      t.timestamps
    end
  end
end
