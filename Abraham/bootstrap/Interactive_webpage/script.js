// JavaScript Document
//Abraham Ewnetu

var main = function(){
	$('.dropdown-toggle').click(function(){
		$('.dropdown.menu').toggle();
		});
	}
	
	$(document).ready(main);
	

var main = function() {
	
	$('.dropdown-toggle').click(function(){
		$('.dropdown.menu').toggle();
		});
	
  /* Push the body and the nav over by 285px over */
  $('.icon-menu').click(function() {
    $('.menu').animate({
      left: "0px"
    }, 200);

    $('body').animate({
      left: "285px"
    }, 200);
  });

  /* Then push them back */
  $('.icon-close').click(function() {
    $('.menu').animate({
      left: "-285px"
    }, 200);

    $('body').animate({
      left: "0px"
    }, 200);
  });
};


$(document).ready(main);