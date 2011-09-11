class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :guest
      t.string :line1
      t.string :line2
      t.string :city
      t.stringzip :state_code
      t.string :country_code
      t.string :province_code

      t.timestamps
    end
    add_index :addresses, :guest_id
  end
end
