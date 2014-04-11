// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('document').ready(function(){
  
  $(".navBtn").hover(
    function(){
      $(this).find('.drop_down').slideDown();
    },
    function(){
      $(this).find('.drop_down').slideUp();
    });
    
});