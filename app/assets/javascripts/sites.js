// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(window).load(function() {
  $(".loader").fadeOut("slow");
});

$('document').ready(function(){
  // Nav bar drop down menu animation
  $(".navBtn").hover(
    function(){
      $(this).find('.drop_down').slideDown(200, function() {
        $(this).clearQueue();
      });
    },
    function(){
      $(this).find('.drop_down').slideUp(200, function() {
        $(this).clearQueue();
      });
    });
   
  // Sprite switch on hover 
  $("#logo_container").hover(
    function(){
      $(this).find('.gz_sprite').removeClass("gz_blue_logo").addClass("gz_green_logo");
    },
    function(){
      $(this).find('.gz_sprite').removeClass("gz_green_logo").addClass("gz_blue_logo");
    });
 
  // Sprite switch on nav bar hover
  $("#nav_bar").hover(
    function(){
      $('.gz_sprite').removeClass().addClass("gz_sprite gz_purple_logo");
    },
    function(){
      $('.gz_sprite').removeClass().addClass("gz_sprite gz_blue_logo");
    });

  // Sprite switch on form submit
  $("form").submit(function(event){
    $('.gz_sprite').removeClass().addClass("gz_sprite gz_red_logo");
    $(".loader").fadeIn("slow");
  });   

  // Sprite switch on link click
  $("a").on("click", function(){
    $('.gz_sprite').removeClass().addClass("gz_sprite gz_red_logo");
    $(".loader").fadeIn("slow");
  });   
  
  
});