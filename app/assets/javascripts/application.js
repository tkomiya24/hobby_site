// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//a= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
'use strict';

var idPrefix = 'inline-edit-';
var editButtonPrefix = idPrefix + 'start-';
var saveButtonPrefix = idPrefix + 'finish-';
var inputPrefix = idPrefix + 'field-';
var valuePrefix = idPrefix + 'value-';

function getFieldName(button) {
  var a = button.id.split('-');
  return a[a.length - 1];
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

function makeUpdateRequest(fieldName, val) {
  //Will fake a success for now
  setField(fieldName, val);
  showField(fieldName);
  hideTextInput(fieldName);
  showEditButton(fieldName);
  hideSaveButton(fieldName);
}

function getNewValue(fieldName) {
  return $('#' + inputPrefix + fieldName).val();
}

$(document).ready(function() {
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
    makeUpdateRequest(fieldName, getNewValue(fieldName));
  });
});
