// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  var users = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/users/search/%QUERY',
      wildcard: '%QUERY'
    }
  });

  $('#search-bar').typeahead(null,
    {
      source: users,
      display: function(user) {
        return user.first_name + ' ' + user.last_name;
      }
    });
});
