class CreateThankYous < ActiveRecord::Migration
  def change
    create_table :thank_yous do |t|
      t.belongs_to :gift
      t.text :note

      t.timestamps
    end
    add_index :thank_yous, :gift_id
  end
end
