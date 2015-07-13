# This class extends default form builder to adapt to Bootstrap theme
#
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  alias :label_orig :label
  alias :submit_orig :submit

  # Overrides default label method of FormBuilder
  def label(method, options = {})
    super(method, options.merge(class: 'col-md-3'))
  end

  # Overrides default text_field method of FormBuilder
  def text_field(method, options = {})
    div_col_md_9 do
      super(method, options.merge(class: 'form-control'))
    end
  end

  # Overrides default text_field method of FormBuilder
  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options.merge!(class: 'form-control')
    div_col_md_9 do
      super(method, choices, options, html_options, &block)
    end
  end

  %w(text_field select).each do |field|
    define_method "#{field}_group" do |method, *args, &block|
      div_form_group do
        label(method) + send(field, method, *args, &block)
      end
    end
  end

  def input_group_for(text, &block)
    @template.content_tag :h4, class: 'm-t-20' do
      text
    end
  end

  # Overrides default submit method of FormBuilder
  def submit(value=nil, options={})
    div_form_group do
      div_col_md_9 do
        options.merge!(class: 'btn btn-sm btn-success')
        # Disable button when the form is submitted
        data_options = options[:data] || {}
        options[:data] = data_options.merge(disable_with: 'Please wait..')
				submit_orig(value, options)
      end
    end
  end

  private

  def div_form_group(&block)
    @template.content_tag :div, class: 'form-group', &block
  end

  def div_col_md_9(&block)
    @template.content_tag :div, class: 'col-md-9', &block
  end
end
