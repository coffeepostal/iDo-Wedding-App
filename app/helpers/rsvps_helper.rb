module RsvpsHelper
  def number_attending_phrase(rsvp, options = {})
    return 'No, I’m sorry, I will not be attending.' unless rsvp.attending?
    case rsvp.number_attending
    when 1
      'I will be attending by myself.'
    when 2
      'I will be bringing a date!'
    else
      "All #{rsvp.number_attending} of us will be there!"
    end
  end
end
