module ApplicationHelper
	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  		html_safe markdown.render (text)
	end

	def html_safe(text)
       return text if text.nil?
       return text.html_safe if defined?(ActiveSupport::SafeBuffer)
       return text.html_safe! if text.respond_to?(:html_safe!)
       text
	end
end
