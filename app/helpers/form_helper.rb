module FormHelper
  def crud_buttons(model)
    render 'shared/crud_buttons', model: model
  end

  # @param [String, ActiveRecord::Base]
  # @yield The content of the panel
  def panel_for(arg, &block)
    if arg.is_a? ActiveRecord::Base
      title = title_from_model(arg)
    elsif arg.is_a? String
      title = arg
    else
      fail 'Invalid panel arg'
    end
    render layout: '/shared/panel', locals: { title: title }, &block
  end

  # @param object [ActiveRecord::Base]
  # @return [String] The title of the panel base on the object and the current
  #   controller param action
  def title_from_model(object)
    action = t "panel.action.#{params[:action]}"
    model = t "model.#{object.class.to_s.downcase}"
    "#{action} #{model}"
  end

  def header_section(key)
    title = t("header.#{key}")
    render '/shared/header_section', title: title
  end

  # Decorates super with bootstrap
  # Overwrites definition at ActionView::Helpers::FormHelper
  def form_for(record, *args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}
    options[:html] = {} unless options.key? :html
    options[:html].merge!(class: 'form-horizontal') unless options[:html].key? :class
    super(record, *(args << options), &block)
  end

  def auth_form_for(record, *args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}
    options[:builder] = AuthFormBuilder
    options[:html] = {} unless options.key? :html
    options[:html].merge!(class: 'margin-bottom-0')
    form_for(record, *(args << options), &block)
  end

  [:form_for, :fields_for, :form_remote_for, :remote_form_for].each do |method|
    define_method "disabled_#{method}".to_s do |object_name, *args, &proc|
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.update(builder: DisabledFormBuilder)
      send(method, object_name, *(args << options), &proc)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'btn btn-primary btn-sm m-r-5 add_fields', data: { id: id, fields: fields.delete("\n") })
  end

  def submit(builder)
    builder.submit unless show?
  end
end
