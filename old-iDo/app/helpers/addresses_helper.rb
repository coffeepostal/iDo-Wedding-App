module AddressesHelper
  def html_for_address(address, wrapper_tag = :ul, line_tag = :li, html_options = {})
    content_tag_for(wrapper_tag, address, html_options) do
      address.lines.map do |line|
        content_tag(line_tag, line) unless line.blank?
      end.compact.join
    end
  end
end