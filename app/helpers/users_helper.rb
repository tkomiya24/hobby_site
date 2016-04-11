module UsersHelper
  def editable_row(attribute, label, value)
    content_tag(:tr) do
      content_tag(:th, label) +
        content_tag(:td) do
          text_field_tag(attribute, value, placeholder: label,
                                           id: 'inline-edit-field-'.concat(attribute),
                                           class: 'inline-edit-field')
        end +
        content_tag(:td, value, id: 'inline-edit-value-'.concat(attribute)) +
        content_tag(:td, id: 'inline-edit-'.concat(attribute)) do
          button_tag('Edit',
                     class: 'inline-edit-start', id: 'inline-edit-start-'.concat(attribute)) +
            button_tag('Save',
                       class: 'inline-edit-finish', id: 'inline-edit-finish-'.concat(attribute))
        end
    end
  end
end
