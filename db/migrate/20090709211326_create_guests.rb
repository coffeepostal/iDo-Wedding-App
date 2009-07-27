class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
