class CreateThankYous < ActiveRecord::Migration
  def self.up
    create_table :thank_yous do |t|
      t.references :gift
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :thank_yous
  end
end
