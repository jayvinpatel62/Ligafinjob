  var heroSlider = new Swiper('.hero-slider', {
  direction: 'horizontal',
  loop: true,
  // cssMode:true,
  slidesPerView: 1,
  effect:'fade',
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }   

});

var blogsSwiper = new Swiper('.blogs_swiper', {
  direction: 'horizontal',
  slidesPerView: 1,
  spaceBetween: 30,
  centeredSlides: false,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  breakpoints: {
   
    640: {
      slidesPerView: 2,
    },
    1024: {
      slidesPerView: 3,
    }
  },
  navigation: false
});

var testimonialSwiper = new Swiper('.testimonial_swiper', {
  direction: 'horizontal',
  slidesPerView: 1,
  centeredSlides: false,
  effect:'slide',
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },

  navigation: false
});

