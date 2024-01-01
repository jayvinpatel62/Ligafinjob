
var sticky = $('body');
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        sticky.addClass("sticky");
    } else {
        sticky.removeClass("sticky");
    }
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 500) {
        $('.scrollTop').show();
    } else {
        $('.scrollTop').hide();
    }
});

$('.scrollTop').click(function () {
    $('html, body').animate({
        scrollTop: 0
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



$(window).resize(function () {
    var width = $(window).width();
    if (width < 767) {
        $('.offcanvas').removeClass('show');
        $('.offcanvas').attr('data-bs-backdrop', true);

    }
    else {
        $('.offcanvas').addClass('show');
        $('.offcanvas').attr('data-bs-backdrop', false);
    }
})
    .resize();


// ------------changes 23 06 2023 ----------//

$(".nav-home-tab .tab-item").click(function () {
    $(".nav-home-tab .tab-item.active").removeClass("active");
    $(this).addClass("active");
});


$(".passShowHide").click(function () {
    $(this).find('.bi').toggleClass("bi-eye bi-eye-slash");
   /* alert(document.getElementById("ctl00_ucLoginPopUp_txtPassword").type);*/
    let type1 = document.getElementById("ctl00_ucLoginPopUp_txtPassword").type;
    ('password' == type1) ? document.getElementById("ctl00_ucLoginPopUp_txtPassword").type = 'text' : document.getElementById("ctl00_ucLoginPopUp_txtPassword").type = 'password';


});

$(".passShowHide1").click(function () {
    $(this).find('.bi').toggleClass("bi-eye bi-eye-slash");
    /* alert(document.getElementById("ctl00_ucLoginPopUp_txtPassword").type);*/
    let type1 = document.getElementById("ctl00_ucLoginPopUp_txtRegPassword").type;
    ('password' == type1) ? document.getElementById("ctl00_ucLoginPopUp_txtRegPassword").type = 'text' : document.getElementById("ctl00_ucLoginPopUp_txtRegPassword").type = 'password';


});

$(".passShowHide2").click(function () {
    /*alert("passShowHide2");*/
    
    /* alert(document.getElementById("ctl00_ucLoginPopUp_txtPassword").type);*/
    let type1 = document.getElementById("ctl00_ContentPlaceHolder1_txtsal").type; /*ctl00$ucLoginPopUp$txtPassword*/
    //alert(type1);
    if ('password' == type1) {
        //alert("1");
        document.getElementById("ctl00_ContentPlaceHolder1_txtsal").type = 'text';
        $(this).find('.bi').removeClass("bi-eye-slash");
        $(this).find('.bi').addClass("bi-eye");
    }
    else {
        //alert("2");
        document.getElementById("ctl00_ContentPlaceHolder1_txtsal").type = 'password';
        $(this).find('.bi').removeClass("bi-eye");
        $(this).find('.bi').addClass("bi-eye-slash");
    }
    /*('password' == type1) ? document.getElementById("ctl00_ContentPlaceHolder1_txtsal").type = 'text' : document.getElementById("ctl00_ContentPlaceHolder1_txtsal").type = 'password';*/


});

$('.forgotPasswordWrapper').hide();
$(".forgotPasswordLink").click(function () {
    $(".forgotPasswordWrapper").show();
    $(".loginDivWrapper").hide();
});
$(".backToLogin").click(function () {
    $(".forgotPasswordWrapper").hide();
    $(".loginDivWrapper").show();
});

$('#cd-verifiy-email').hide();
function ShowVerifyEmail(email) {
    
    $('.tab-content').hide();
    $('#cd-verifiy-email').show();

}
//Fancybox.bind("[data-fancybox]", {
//    // Your custom options
//});
//Fancybox.bind('[data-fancybox="Video-gallery"]', {
//    // Your custom options
//});

$("#alert-close").click(function showAlert() {
    $("#mainAlert").alert('close');
});

$(".filter-header-mobile").click(function () {
    $(".aside-filter-wrapper").toggle();
    $(".overlay-filter").toggle();
});
$(".filter-close").click(function () {
    $(".aside-filter-wrapper").toggle();
    $(".overlay-filter").toggle();
});
$(".viewProfile-modal").click(function () {
    $("#viewmyProfile-modal").addClass('show');
});
$(".myModal .btn-close").click(function () {
    $(".myModal.show").removeClass('show');
});

