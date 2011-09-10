class MoveAdditionalNamesFromAddressesToGuests < ActiveRecord::Migration
  def self.up
    # add new column first
    add_column :guests, :additional_names, :string
    
    # then move the data from the old column to the new column
    Address.all(:conditions => 'addresses.additional_names NOT NULL', :include => :guest).each do |address|
      next if address.guest.blank?
      address.guest.additional_names = address.additional_names
      address.guest.save(false)
    end
    
    # then remove the old column
    remove_column :addresses, :additional_names
  end

  # reverse everything done above
  def self.down
    # add the old column back in
    add_column :addresses, :additional_names, :string
    
    # move the data back from the new column to the old
    Guest.all(:conditions => 'guests.additional_names NOT NULL', :include => :address).each do |guest|
      address = guest.address || guest.build_address
      address.additional_names = guest.additional_names
      address.save(false)
    end
    
    # remove the new column
    remove_column :guests, :additional_names
  end
end
