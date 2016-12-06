$(document).ready(function(){
  $('.comments').click(function(event){
    event.preventDefault();
    $(this).parents('.interaction').next('.comment').slideToggle("fast");
    $(this).parents('.interaction').next('.comment').find('.comment-content').focus();
  });

});
