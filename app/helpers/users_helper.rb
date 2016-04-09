module UsersHelper
  def editable_row(attribute, label, value)
    content_tag(:tr) do
      content_tag(:th, label) +
        content_tag(:td, value) +
        content_tag(:td) do
          link_to('Edit', {}, class: 'inline-edit-link')
        end +
        content_tag(:td) do
          text_field_tag(attribute, value, placeholder: label, class: 'inline-edit-field')
        end
    end
  end
end
