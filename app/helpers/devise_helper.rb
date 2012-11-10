module DeviseHelper
  def devise_error_messages!
    puts defined?(resource)
    return '' if !defined?(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <strong>Error: </strong>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end