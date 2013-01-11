module ApplicationHelper
	def markdown(text)
		  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :fenced_code_blocks => true, :hard_wrap => true)
  		html_safe markdown.render (text)
	end
  
  def active?(page_name, add = "")
      raw "class=\"active #{add} \"" if current_page?(page_name)
  end

	def html_safe(text)
       return text if text.nil?
       return text.html_safe if defined?(ActiveSupport::SafeBuffer)
       return text.html_safe! if text.respond_to?(:html_safe!)
       text
	end
  
end
