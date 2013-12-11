class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :star
      t.references :hotel
      t.references :user

      t.timestamps
    end
    add_index :ratings, :hotel_id
    add_index :ratings, :user_id
  end
end
