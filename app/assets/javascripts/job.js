
var lookup_job = function(){
  $("#job-lookup-form").on('ajax:before', function(event, data, status){
    show_spinner();
  });

  $("#job-lookup-form").on('ajax:success', function(event, data, status){
    $("#job-lookup").replaceWith(data);
    lookup_job();
  });

  $('#job-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#job_lookup_result').replaceWith(' ');
    $('#job_lookup_error').replaceWith('Job was not found.');
  });

  $("#job-lookup-form").on('ajax:complete', function(event, data, status){
    show_spinner();
  });
};

$(document).ready(function(){
  lookup_job();
});
