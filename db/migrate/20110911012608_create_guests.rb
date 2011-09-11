class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :honorific
      t.string :first_name
      t.string :last_name
      t.string :name_suffix
      t.string :email
      t.string :pin

      t.timestamps
    end
  end
end
