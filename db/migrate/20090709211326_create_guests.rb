class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :prefix, :first_name, :last_name, :email
      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
