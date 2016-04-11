var inlineEdit = (function() {
  'use strict';

  var idPrefix = 'inline-edit-';
  var editButtonPrefix = idPrefix + 'start-';
  var saveButtonPrefix = idPrefix + 'finish-';
  var inputPrefix = idPrefix + 'field-';
  var valuePrefix = idPrefix + 'value-';
  var formPrefix = idPrefix + 'form-';

  function getFieldName(button) {
    return $(button).parent().attr('id').replace(idPrefix, '');
  }

  function makeFieldDisapper(fieldName) {
    $('#' + valuePrefix + fieldName).hide();
  }

  function makeTextInputAppear(fieldName) {
    $('#' + inputPrefix + fieldName).show();
  }

  function makeSaveButtonAppear(fieldName) {
    $('#' + saveButtonPrefix + fieldName).show();
  }

  function setField(fieldName, val) {
    $('#' + valuePrefix + fieldName).html(val);
  }

  function showField(fieldName) {
    $('#' + valuePrefix + fieldName).show();
  }

  function hideTextInput(fieldName) {
    $('#' + inputPrefix + fieldName).hide();
  }

  function showEditButton(fieldName) {
    $('#' + editButtonPrefix + fieldName).show();
  }

  function hideSaveButton(fieldName) {
    $('#' + saveButtonPrefix + fieldName).hide();
  }

  function submitForm(fieldName) {
    $('#' + formPrefix + fieldName).submit();
  }

  function getNewValue(fieldName) {
    return $('#' + inputPrefix + fieldName).val();
  }

  var inlineEdit = {};
  inlineEdit.init = function() {
    $('input.inline-edit-field').hide();
    $('.inline-edit-finish').hide();

    $('button.inline-edit-start').click(function(event) {
      var fieldName = getFieldName(this);
      makeFieldDisapper(fieldName);
      makeTextInputAppear(fieldName);
      $(this).hide(); //make the edit button disappear
      makeSaveButtonAppear(fieldName);
    });

    $('button.inline-edit-finish').click(function(event) {
      var fieldName = getFieldName(this);
      submitForm(fieldName);
    });
  };

  return inlineEdit;
})();
