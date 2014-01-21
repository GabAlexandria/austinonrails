function isViewable(img) {
  var windowTop = $(window).scrollTop();
  var windowBottom = windowTop + img.height() - 150;

  var imgTop = Math.round(img.offset().top);
  var imgBottom = imgTop + img.height();

  return ( (imgTop <= windowBottom) && (imgBottom >= windowTop) )
}

$(document).ready(function() {
  
  $(window).scroll(function(){
    $('section[data-type="background"]').each(function() {
      $background = $(this);
      var yStart = Math.round( $background.offset().top / 10 );

      if  ( isViewable($background) ) {
        var yPos = yStart - ( $(window).scrollTop() / $background.data('speed'));
        var coords = '50% ' + yPos + 'px';
        $background.css({ backgroundPosition: coords });
      }
    });
  });
});

/*$(document).ready(function() {
  $(window).scroll(function() {
    console.log($(".header ul li").offset().top)
    if ( $(".header ul li").offset().top <= $(window).scrollTop() ) {
      $(".header ul").addClass("fixed")
    } else {
      $(".header ul").removeClass("fixed")
    }
  })
}) */
