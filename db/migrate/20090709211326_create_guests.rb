class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :salutation, :first_name, :last_name, :email, :pin
      t.boolean :admin, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
