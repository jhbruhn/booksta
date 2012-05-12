class BootStrapFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(method, options={})
    t = @template
    t.content_tag(:div, :class => "control-group#{' error' unless @object.errors[method].blank?}") {
      t.concat(t.label  field_id_for (method.to_s), method, :class=>"control-label")
      t.concat(t.content_tag(:div, :class => "controls") {
        t.concat(super method, :class => "text-field")
        if @object.errors[method].present?
          t.concat(t.content_tag(:span, options[:help_text], :class => 'help-inline'))
        end
      })
    }
  end
  
  def text_area(method, options={})
    t = @template
    t.content_tag(:div, :class => "control-group#{' error' unless @object.errors[method].blank?}") {
      t.concat(t.label  field_id_for (method), method, :class=>"control-label")
      t.concat(t.content_tag(:div, :class => "controls") {
        t.concat(super method, options)
        if @object.errors[method].present?
          t.concat(t.content_tag(:span, options[:help_text], :class => 'help-inline'))
        end
      })
    }
  end
  
  def email_field(method, options={})
    t = @template
    t.content_tag(:div, :class => "control-group#{' error' unless @object.errors[method].blank?}") {
      t.concat(t.label  field_id_for (method), method, :class=>"control-label")
      t.concat(t.content_tag(:div, :class => "controls") {
        t.concat(super method, :class => "email-field")
        if @object.errors[method].present?
          t.concat(t.content_tag(:span, options[:help_text], :class => 'help-inline'))
        end
      })
    }
  end
  
  def password_field(method, options={})
    t = @template
    t.content_tag(:div, :class => "control-group#{' error' unless @object.errors[method].blank?}") {
      t.concat(t.label  field_id_for (method), method, :class=>"control-label")
      t.concat(t.content_tag(:div, :class => "controls") {
        t.concat(super method, :class => "password-field")
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