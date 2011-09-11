class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.belongs_to :guest
      t.boolean :attending
      t.integer :number_attending
      t.integer :max_number_attending
      t.boolean :group_rsvp
      t.boolean :admin_rsvp

      t.timestamps
    end
    add_index :rsvps, :guest_id
  end
end
