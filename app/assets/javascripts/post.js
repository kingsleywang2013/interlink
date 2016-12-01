$(document).ready(function(){
  $('#share-update').click(function(){
    $('#post-form').slideToggle( "slow" );
  });

  $('#upload-image').click(function(){
    $("input[id='my_file']").click();
    $("input[id='my_file']").css("display", "inline");

  });

  $('.deletePhoto').click(function() {
      $('#my_file').css("display","none");
      $('#my_file').val('');
      $(".deletePhoto").css("display", "none");
      $(".image-prev").css("display", "none");
  });

});

function readURL(input) {
  if (input.files && input.files[0]) {
  var reader = new FileReader();

  reader.onload = function (e) {
  $('#img_prev')
  .attr('src', e.target.result)
  .width(250)
  .height(200);
  };

  reader.readAsDataURL(input.files[0]);
  }
  $('#img_prev').css("display", "inline");
  $(".deletePhoto").css("display", "inline");
}

