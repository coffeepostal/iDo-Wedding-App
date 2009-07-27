class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.references :guest
      t.string :gift
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
