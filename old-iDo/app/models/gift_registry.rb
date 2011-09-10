class GiftRegistry < Struct.new(:name, :slug, :image_path, :url)
  
  REGISTRIES = [
    ['Macy’s',              'macys',                'img-registry-logo-macys.png',
      'http://registry.weddingchannel.com/gvr/guestregistrydetail.action?retailer_registry_uid=310485632&listby=dept', ],
    ['Crate & Barrel',      'crate-and-barrel',     'img-registry-logo-Crate&Barrel.png',
      'http://www.crateandbarrel.com/Gift-Registry/Guest/ViewRegistry.aspx?grid=4291770'],
    ['Williams Sonoma',     'williams-sonoma',      'img-registry-logo-WilliamsSonoma.png',
      'http://www.williams-sonoma.com/registry/findregistry.cfm'],
    ['Sur la Table',        'sur-la-table',         'img-registry-logo-SurLaTable.png',
      'http://giftreg.surlatable.com/slt/grws'],
    ['Bed, Bath & Beyond',  'bed-bath-and-beyond',  'img-registry-logo-BedBath&Beyond.png',
      'http://www.bedbathandbeyond.com/regGiftRegistry.asp?order_num=-1&wrn=%2D549261437&']
  ]
  
  class << self
    def all
      REGISTRIES.map do |registry|
        self.new(*registry)
      end
    end
    
    def first
      self.new(*REGISTRIES.first)
    end
    
    def last
      self.new(*REGISTRIES.last)
    end
    
    def find(*index_or_array_of_indices)
      return nil unless index_or_array_of_indices.all? {|i| i.is_a?(Integer)}
      index_or_array_of_indices.map {|i| i - 1}
      
      if index_or_array_of_indices.length == 1
        return nil unless included?(index_or_array_of_indices.first)
        self.new(*REGISTRIES[index_or_array_of_indices.first - 1])
      else
        registries = []
        index_or_array_of_indices.each do |index|
          return nil unless included?(index)
          registries << self.new(*REGISTRIES[index])
        end
        registries
      end
    end
    
    private
    
    def included?(index)
      (0..(REGISTRIES.length - 1)).include?(index)
    end
  end
  
  def blank?
    values.all?(&:blank?)
  end
  
  #   <p class="column"><a href="http://registry.weddingchannel.com/gvr/guestregistrydetail.action?retailer_registry_uid=310485632&listby=dept" target="_blank"><%= image_tag("img-registry-logo-macys.png") %></a></p>
  # <p class="column"><a href="http://www.crateandbarrel.com/Gift-Registry/Guest/ViewRegistry.aspx?grid=4291770" target="_blank"><%= image_tag("img-registry-logo-Crate&Barrel.png") %></a></p>
  # <p class="column"><a href="http://www.williams-sonoma.com/registry/findregistry.cfm" target="_blank"><%= image_tag("img-registry-logo-WilliamsSonoma.png") %></a></p>
  # <p class="column"><a href="http://giftreg.surlatable.com/slt/grws" target="_blank"><%= image_tag("img-registry-logo-SurLaTable.png") %></a></p>
  # <p class="column"><a href="http://www.bedbathandbeyond.com/regGiftRegistry.asp?order_num=-1&wrn=%2D549261437&" target="_blank"><%= image_tag("img-registry-logo-BedBath&Beyond.png") %></a></p>
end
