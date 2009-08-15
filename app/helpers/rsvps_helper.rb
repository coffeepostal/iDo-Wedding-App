module RsvpsHelper
  def number_attending_select_options(rsvp)
    # Only 2 options if rsvp.max_number_attending == 2
    return options_for_select([['No', 1], ['Yes', 2]], rsvp.number_attending) unless rsvp.max_number_attending > 2
    
    # Otherwise, we really have only 1 "No" option
    options = options_for_select([['No', 1]], rsvp.number_attending)
    
    # But several "Yes" options
    grouped_options = { 'Yes' => [] }
    (2..rsvp.max_number_attending).to_a.each do |opt|
      grouped_options['Yes'] << ["+#{opt - 1}", opt]
    end
    
    # Return the combination of the singular "No" option and the grouped "Yes" options
    options << grouped_options_for_select(grouped_options, rsvp.number_attending)    
  end
  
  def number_attending_content(rsvp, html_tag = :p, html_options = {})
    content_tag(
      html_tag,
      (case rsvp.number_attending
      when 1: 'Yes, I will be attending by myself.'
      when 2: 'Yes, I will be attending with a date.'
      else "Yes, all #{rsvp.number_attending.try(:to_word)} of us will be attending."
      end),
      html_options
    )
  end
  
  def wedding_location_map_content(options = {})
    returning '' do |html|
      html << content_tag(:iframe, '', :width => 840, :height => 350, :frameborder => 0, :scrolling => 'no', :marginheight => 0, :marginwidth => 0, :src => 'http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=405+Fieldston+Rd+Bellingham,+WA+98225+(Lairmont+Manor)&amp;sll=48.710748,-122.509611&amp;sspn=0.006662,0.008948&amp;ie=UTF8&amp;ll=48.717866,-122.505369&amp;spn=0.01982,0.068665&amp;z=14&amp;iwloc=A&amp;output=embed')
      html << tag(:br)
      html << tag(:small)
        html << link_to('View Larger Map', 'http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=405+Fieldston+Rd+Bellingham,+WA+98225+(Lairmont+Manor)&amp;sll=48.710748,-122.509611&amp;sspn=0.006662,0.008948&amp;ie=UTF8&amp;ll=48.717866,-122.505369&amp;spn=0.01982,0.068665&amp;z=14&amp;iwloc=A', :style => 'color:#0000FF;text-align:left')
      html << '</small>'
      html << tag(:noscript)
        html << tag(:ul, :class => 'address')
          html << content_tag(:li, 'Lairmont Manor')
          html << content_tag(:li, '405 Fieldston Road')
          html << content_tag(:li, 'Bellingham, WA 98225')
        html << '</ul>'
      html << '</noscript>'
      html << content_tag(:div, '', :class => 'clear')
    end
  end
  
  def gift_registry_links
    @gift_registry_links ||= (
      GiftRegistry.all.map do |registry|
        content_tag(:p,
          link_to(image_tag(registry.image_path), registry.url,
            :title => registry.name, :alt => registry.slug, :target => '_blank'),
          :class => 'column'
        )
      end.join
    )
  end
  
end
