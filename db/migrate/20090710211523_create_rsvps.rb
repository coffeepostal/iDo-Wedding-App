class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.references :guest
      t.boolean :attending
      t.integer :number_attending
      t.boolean :group_rsvp, :admin_rsvp
      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
