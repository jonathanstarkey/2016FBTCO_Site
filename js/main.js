/* NAV ONSCROLL */
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

 /* ensure the affix element maintains it width */
if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
   
function affixWidth() {
    var affix = $('#nav');
    var width = affix.width();
    affix.width(width);
}

$(document).ready(function () {

    affixWidth();

});
}





/* CHANGE NAV CLASS */

$(function() {
    var header = $(".nav-logo-lg");
    $(window).scroll(function() {    
        var scroll = $(window).scrollTop();
    
        if (scroll >= 200) {
            header.removeClass('nav-logo-lg').addClass("nav-logo-sm");
        } else {
            header.removeClass("nav-logo-sm").addClass('nav-logo-lg');
        }
    });
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

/* HOMEPAGE VIDEO STOP PLAYING WHEN CLOSED*/
$(document).ready(function(){
    /* Get iframe src attribute value i.e. YouTube video url
    and store it in a variable */
    var url = $("#meetFatBrainVideo").attr('src');
    
    /* Assign empty url value to the iframe src attribute when
    modal hide, which stop the video playing */
    $("#meet-fat-brain-play-button").on('hide.bs.modal', function(){
        $("#meetFatBrainVideo").attr('src', '');
    });
    
    /* Assign the initially stored url back to the iframe src
    attribute when modal is displayed again */
    $("#meet-fat-brain-play-button").on('show.bs.modal', function(){
        $("#meetFatBrainVideo").attr('src', url);
    });
});


/* HOMEPAGE VIDEO RESPONSIVE * /


