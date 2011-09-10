require 'test/unit'

require 'rubygems'
require 'active_record'

require "#{File.dirname(__FILE__)}/../init"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")

def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table :addresses do |t|
      t.string :street_1, :null => false
      t.string :street_2, :null => true
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.string :zip_4, :null => true
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Address < ActiveRecord::Base
  
  nullify :street_2, :zip_4
  
  validates_presence_of :street_1, :city, :zip
  validates_format_of :zip, :with => /^\d{5}$/, :allow_nil => false
  validates_format_of :zip_4, :with => /^\d{4}/, :allow_nil => true
end

class AddressTest < Test::Unit::TestCase

  def setup
    setup_db
    Address.create!(
      :street_1 => 'Department of the Teasury',
      :street_2 => 'Internal Revenue Service',
      :city => 'Kansas City',
      :state => 'Missouri',
      :zip => '64999',
      :zip_4 => '0102'
    )
    Address.create!(
      :street_1 => '1 Infinite Loop',
      :city => 'Cupertino',
      :state => 'California',
      :zip => '95014'
    )
  end
  
  def irs
    Address.first
  end
  
  def apple
    Address.last
  end

  def teardown
    teardown_db
  end
  
  def test_no_nullification_needed
    before = irs.attributes
    irs.save
    after = irs.attributes
    assert_equal(before, after)
    before = apple.attributes
    apple.save
    after = apple.attributes
    assert_equal(before, after)
  end
  
  def test_nullification_needed
    assert(irs.update_attributes(:zip_4 => ''))
    assert_nil(irs.zip_4)
    assert(irs.update_attributes(:zip_4 => ' '))
    assert_nil(irs.zip_4)
    assert(irs.update_attributes(:zip_4 => '1939'))
    assert_equal('1939', irs.zip_4)
  end
end
