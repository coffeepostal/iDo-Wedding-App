# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def stylesheet_for_controller
      cname = controller.controller_name.singularize
      File.exists?(File.join(Rails.root, 'public', 'stylesheets', "#{cname}.css")) ?
        stylesheet_link_tag(cname, :media => :screen) : ''
  end
  
  def content_classes
      cname = controller.controller_name
      aname = controller.action_name
      [cname, [aname, cname].join('_')].join(' ')
  end
  
  def button(name, options = {}, html_options = {})
    html_options[:class] = "#{html_options[:class]} my-button-class".strip
    link_to(content_tag(:span, name), options, html_options)
  end

  def submit_button(name, options = {})
    options = {} unless options.is_a? Hash
    options[:class] = "#{options[:class]} my-button-class".strip
    options[:type]  = 'submit'
    content_tag(:button, content_tag(:span, name), options)
  end
end
