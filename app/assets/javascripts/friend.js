
var lookup_friend = function(){
  $("#friend-lookup-form").on('ajax:before', function(event, data, status){
    show_spinner();
  });

  $("#friend-lookup-form").on('ajax:success', function(event, data, status){
    $("#friend-lookup").replaceWith(data);
    lookup_friend();
  });

  $('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#friend_lookup_result').replaceWith(' ');
    $('#friend_lookup_error').replaceWith('Person was not found.');
  });

  $("#friend-lookup-form").on('ajax:complete', function(event, data, status){
    show_spinner();
  });
};

$(document).ready(function(){
  lookup_friend();
});
