class Shadcn::FormBuilder < ActionView::Helpers::FormBuilder
  def label method, label_text = nil, options = {}
    error_class = @object.errors[method].any? ? "error" : ""
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    label_text ||= label_for(@object, method)
    @template.render_label(name: "#{object_name}[#{method}]",
                           label: label_text, **options)
  end

  def text_field method, options = {}
    error_class = @object.errors[method].any? ? "error" : ""
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_input(
      name: "#{object_name}[#{method}]",
      id: "#{object_name}_#{method}",
      value: @object.send(method),
      type: "text", **options
    )
  end

  def password_field method, options = {}
    error_class = @object.errors[method].any? ? "error" : ""
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_input(
      name: "#{object_name}[#{method}]",
      id: "#{object_name}_#{method}",
      value: @object.send(method),
      type: "password", **options
    )
  end

  def email_field method, options = {}
    error_class = @object.errors[method].any? ? "error" : ""
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_input(
      name: "#{object_name}[#{method}]",
      id: "#{object_name}_#{method}",
      value: @object.send(method),
      type: "email", **options
    )
  end

  def text_area method, options = {}
    error_class = @object.errors[method].any? ? "error" : ""
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_textarea(
      name: "#{object_name}[#{method}]",
      id: "#{object_name}_#{method}",
      value: @object.send(method),
      type: "text", **options
    )
  end

  def submit value = nil, options = {}
    @template.render_button(value, **options)
  end

  private

  def label_for object, method
    return method.capitalize if object.nil?

    object.class.human_attribute_name(method)
  end
end
