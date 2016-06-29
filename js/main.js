$('#nav').affix({
      offset: {
        top: $('.overlay').height()-$('#nav').height()
      }
});	

/* highlight the top nav as scrolling occurs */
$('body').scrollspy({ target: '#nav' })

/* smooth scrolling for scroll to top */
$('.scroll-top').click(function(){
  $('body,html').animate({scrollTop:0},1000);
})

/* smooth scrolling for nav sections */
$('#nav .navbar-nav li>a').click(function(){
  var link = $(this).attr('href');
  var posi = $(link).offset().top;
  $('body,html').animate({scrollTop:posi},700);
});

$(document).scroll(function() {
  
  if ($(this).scrollTop() >= 100) {
    
    $(".logo").html("<img src='img/fatbraintoco.png'>");
	} else {
    
    $(".logo").html("<img src='img/fatbraintoco.png'>");
  }
	
});

/* add logo affix */
/*$(window).scroll(function(){
   var height = $(this).scrollTop();
    if (height > 100){
         $('#brand').show();   
    }
    else {
      $('#brand').hide();   
    }
});

/* carousel */
$('.carousel').carousel({
  interval: 6000,
  pause: "false"
});

var $item = $('.carousel .item');
var $wHeight = $(window).height();

$item.height($wHeight); 
$item.addClass('full-screen');

$('.carousel img').each(function() {
  var $src = $(this).attr('src');
  var $color = $(this).attr('data-color');
  $(this).parent().css({
    'background-image' : 'url(' + $src + ')',
    'background-color' : $color
  });
  $(this).remove();
});

$(window).on('resize', function (){
  $wHeight = $(window).height();
  $item.height($wHeight);
});

