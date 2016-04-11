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

function initTypeahead() {
  var users = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/users/search/%QUERY',
      wildcard: '%QUERY'
    }
  });
  var selectedItem;
  $('#search-bar').typeahead(null,
    {
      source: users,
      display: function(user) {
        return user.first_name + ' ' + user.last_name;
      },
      templates: {
        suggestion: function(user) {
          var firstName = user.first_name ? user.first_name : '';
          var lastName = user.last_name ? user.last_name : '';
          var fullName = firstName + ' ' + lastName;
          fullName.trim();
          return ['<a class="suggestion-links" href="/users/' + user.id + '">',
                  '<span>' + user.username + '</span>',
                  fullName,
                  '</a>'].join('\n');
        }
      }
    })
    .on('typeahead:selected', function(event, item) {
      selectedItem = item;
      console.log(selectedItem);
    })
    .on('keydown', function(event) {
      if (event.which === 13) {
        event.preventDefault();
        if (selectedItem) {
          window.location.href = '/users/' + selectedItem.id;
        }
      }
    });
}

$(document).ready(function() {
  inlineEdit.init();
  initTypeahead();
});
