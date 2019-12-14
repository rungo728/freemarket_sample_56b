$(document).on('turbolinks:load', function(){

  $('#category-ladies').on('click', function(e){
    e.preventDefault();
    function scrollLadies(){
      var target = $('#target-ladies')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollLadies();
  })

  $('#category-mens').on('click', function(e){
    e.preventDefault();
    function scrollMens(){
      var target = $('#target-mens')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollMens();
  })

  $('#category-phones').on('click', function(e){
    e.preventDefault();
    function scrollPhones(){
      var target = $('#target-phones')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollPhones();
  })

  $('#category-toys').on('click', function(e){
    e.preventDefault();
    function scrollToys(){
      var target = $('#target-toys')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollToys();
  })

  $('#brand-chanels').on('click', function(e){
    e.preventDefault();
    function scrollLadies(){
      var target = $('#target-chanels')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollLadies();
  })

  $('#brand-supremes').on('click', function(e){
    e.preventDefault();
    function scrollSupremes(){
      var target = $('#target-supremes')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollSupremes();
  })

  $('#brand-vitons').on('click', function(e){
    e.preventDefault();
    function scrollVitons(){
      var target = $('#target-vitons')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollVitons();
  })

  $('#brand-nikes').on('click', function(e){
    e.preventDefault();
    function scrollNikes(){
      var target = $('#target-nikes')
      var position = target.offset().top;
      $('html, body').animate({scrollTop: position}, 300);
    }
    scrollNikes();
  })
})