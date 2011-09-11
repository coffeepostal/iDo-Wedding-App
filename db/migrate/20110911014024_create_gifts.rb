class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.belongs_to :guest
      t.string :gift
      t.text :description
      t.text :notes

      t.timestamps
    end
    add_index :gifts, :guest_id
  end
end
