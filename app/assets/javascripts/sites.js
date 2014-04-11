// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('document').ready(function(){
  
  $(".navBtn").hover(
    function(){
      $(this).find('.drop_down').slideDown();
      $('.gz_sprite').removeClass().addClass("gz_sprite gz_purple_logo");
    },
    function(){
      $(this).find('.drop_down').slideUp();
      $('.gz_sprite').removeClass().addClass("gz_sprite gz_blue_logo");
    });
    
  $("#logo_container").hover(
    function(){
      $(this).find('.gz_sprite').removeClass("gz_blue_logo").addClass("gz_green_logo");
    },
    function(){
      $(this).find('.gz_sprite').removeClass("gz_green_logo").addClass("gz_blue_logo");
    });
 
  $("form").submit(function(event){
    $('.gz_sprite').removeClass().addClass("gz_sprite gz_red_logo");
  });   

  $("a").on("click", function(){
    $('.gz_sprite').removeClass().addClass("gz_sprite gz_red_logo");
  });   
  
  
});