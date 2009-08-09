module GuestsHelper
  
  def guest_status_content(guest, html_tag = :p, html_options = {})
    html_options[:class] = "#{html_options[:class]} status".strip
    
    content_tag(
      html_tag,
      (returning '' do |html|
  		  if guest.has_rsvped?
		      html << 'Thank you for your RSVP. '
          if @session_guest.is_attending?
            html << 'We’re looking forward to seeing you at the wedding! '
            html << 'If you need to change any details, you can always log back in here and make those changes.'
          else
            html << 'We’re sorry we won’t see you at the wedding. '
            html << 'If your situation changes, and you can come, feel free to log back in here and change your RSVP.'
  			  end
    		else
          html << 'Please confirm that all the information below is correct. '
          html << 'If not, go ahead and click on the “Update My Info” button below.'
    		end
    	end),
    	html_options
    )
  end
  
  
  def guest_email_address_content(guest, html_tag = :p, html_options = {})
    html_options[:class] = "#{html_options[:class]} email".strip
    
    content_tag(
      html_tag,
      (returning '' do |html|
        if guest.email?
          if @admin_user
            html << 'Send an email to: '
            html << mail_to(guest.email, guest.safe_email, :encode => :hex, :subject => 'AdamGotDiana.Com - Diana and Adam’s Wedding Site')
          else
            html << guest.safe_email
            html << " (#{link_to 'change it', edit_guest_path(:anchor => 'email')})"
          end
        else
          html << "No email address entered, please add one: #{link_to 'Enter Email Address', @admin_user ? edit_admin_guest_path(guest) : edit_guest_path(:anchor => 'email')}."
        end
      end),
      html_options
    )
  end
end
