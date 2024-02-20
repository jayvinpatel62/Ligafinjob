
var sticky = $('body');
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
        sticky.addClass("sticky");
    } else {
        sticky.removeClass("sticky");
    }
});

$('.scrollTop').click(function() {
  $('html, body').animate({
      scrollTop : 0
  }, 1000);
  return false;
});



   // preloader script
  $('body').css({ 'overflow': 'hidden' });
  $(window).on('load', function () { // makes sure the whole site is loaded
    $('#status').fadeOut(); // will first fade out the loading animation
    $('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
    $('body').delay(350).css({ 'overflow': 'visible' });
  });



$(window).resize(function(){
   var width = $(window).width();
   if(width < 767){
       $('.offcanvas').removeClass('show');
       $('.offcanvas').attr('data-bs-backdrop', true);
       
   }
   else{
    $('.offcanvas').addClass('show');
    $('.offcanvas').attr('data-bs-backdrop', false);
}
})
.resize();

  
// ------------changes 23 06 2023 ----------//

$(".nav-home-tab .tab-item").click(function(){
    $(".nav-home-tab .tab-item.active").removeClass("active");
    $(this).addClass("active"); 
  });
  

  $(".passShowHide").click(function(){
    $(this).find('.bi').toggleClass("bi-eye bi-eye-slash"); 
  });

  $('.forgotPasswordWrapper').hide();
  $(".forgotPasswordLink").click(function(){
    $(".forgotPasswordWrapper").show(); 
    $(".loginDivWrapper").hide(); 
  });
  $(".backToLogin").click(function(){
    $(".forgotPasswordWrapper").hide(); 
    $(".loginDivWrapper").show(); 
  });

  // Fancybox.bind("[data-fancybox]", {
  //   // Your custom options
  // });
  // Fancybox.bind('[data-fancybox="Video-gallery"]', {
  //   // Your custom options
  // });

  $("#alert-close").click(function showAlert() {
    $("#mainAlert").alert('close');             
 });  

 $("body").addClass('hide-filter'); 
 $(".filter-header-mobile").click(function(){
  $("body").toggleClass('hide-filter show-filter'); 
});
//  $(".filter-header-mobile").click(function(){
//   $("body").toggleClass('show-filter hide-filter'); 
// });
$(".aside-filter-wrapper .filter-close").click(function(){
  $("body").toggleClass('show-filter hide-filter'); 
});