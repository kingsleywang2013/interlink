$(document).ready(function(){
  $('#share-update').click(function(){
    $('#post-form').slideToggle( "slow" );
  });

  $('#upload-image').click(function(){
    $("input[id='my_file']").click();
    $("input[id='my_file']").css("display", "block");
  });
})
