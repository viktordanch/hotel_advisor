class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :star
      t.references :hotel

      t.timestamps
    end
    add_index :ratings, :hotel_id
  end
end
