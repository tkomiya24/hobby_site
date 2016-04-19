module UsersHelper
  def editable_row(entity, attribute, label, value)
    content_tag(:tr) do
      content_tag(:th, label) +
        content_tag(:td) do
          form_for(entity,
                   url: user_path, method: :put,
                   html: { id: 'inline-edit-form-'.concat(attribute) }) do |f|
            f.text_field(attribute, placeholder: label,
                                    id: 'inline-edit-field-'.concat(attribute),
                                    class: 'inline-edit-field')
          end
        end +
        content_tag(:td, value, id: 'inline-edit-value-'.concat(attribute)) +
        content_tag(:td, id: 'inline-edit-'.concat(attribute)) do
          button_tag('Edit',
                     class: 'inline-edit-start', id: 'inline-edit-start-'.concat(attribute)) +
            button_tag('Save',
                       class: 'inline-edit-finish', id: 'inline-edit-finish-'.concat(attribute)) +
            button_tag('Cancel',
                       class: 'inline-edit-cancel', id: 'inline-edit-cancel-'.concat(attribute))
        end
    end
  end
end
