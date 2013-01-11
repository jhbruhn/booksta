class BootStrapFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(method, options={})
    t = @template
    super_method = super method
    build_form_input(t, "text-field", super_method, options)
    
  end
  
  def text_area(method, options={})
    t = @template
    super_method = super method
    build_form_input(t, "", super_method, options)
    
  end
  
  def email_field(method, options={})
    t = @template
    super_method = super method
    build_form_input(t, "email-field", super_method, options)
    
  end
  
  def password_field(method, options={})
    t = @template
    super_method = super method
    build_form_input(t, "password-field", super_method, options)
  end
  
  def build_form_input(t, class, super_method, options={})
    t.content_tag(:div, :class => "control-group#{' error' unless @object.errors[method].blank?}") {
      t.concat(t.label  field_id_for (method), method, :class=>"control-label")
      t.concat(t.content_tag(:div, :class => "controls") {
        t.concat(super_method, :class => class)
        if @object.errors[method].present?
          t.concat(t.content_tag(:span, options[:help_text], :class => 'help-inline'))
        end
      })
    }
  end
  
  def sanitized_object_name
      @sanitized_object_name ||= object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
  end

  def field_id_for(method)
    "#{sanitized_object_name}"
  end

end