class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :post_code
      t.string :house_number
      t.string :house_name
      t.string :street_1
      t.string :street_2
      t.string :county
      t.string :district
      t.integer :user_id

      t.timestamps
    end
  end
end
