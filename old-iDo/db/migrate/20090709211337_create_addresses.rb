class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :guest
      t.string :line_1, :line_2, :city, :state, :zip, :country, :province, :additional_names
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
