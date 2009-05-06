# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  require 'RedCloth'
  
  def format_text(text)
    RedCloth.new(text).to_html
  end
end
