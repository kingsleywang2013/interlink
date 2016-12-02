$(document).ready(function(){
  $('#profile_img').click(function(){
    $("input[id='my_avatar']").click();
  })
});

function avatarURL(input) {
  if (input.files && input.files[0]) {
  var reader = new FileReader();

  reader.onload = function (e) {
  $('#profile_avatar')
  .attr('src', e.target.result)

  };

  reader.readAsDataURL(input.files[0]);
  }
  $('#gravatar').css('display','none');
  $('#profile_avatar').css('display','inline');
}
