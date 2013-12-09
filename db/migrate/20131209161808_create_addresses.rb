class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.references :hotel

      t.timestamps
    end
    add_index :addresses, :hotel_id
  end
end
