module UsersHelper
  def editable_row(attribute, label, value)
    content_tag(:tr) do
      content_tag(:th, label) +
        content_tag(:td, value) +
        content_tag(:td) do
          button_tag('Edit', class: 'inline-edit-start')
        end +
        content_tag(:td) do
          text_field_tag(attribute, value, placeholder: label, class: 'inline-edit-field')
        end
    end
  end
end
