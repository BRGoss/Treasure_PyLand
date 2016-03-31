/*Abraham Ewnetu
  This program is the combination of three screpting languages
    -Javascript, 
    -JQuiry, 
    -AJAX.
*/



/*a javascript program the generetes question and after user key in the answer tells if the user if
the answer is correct*/
/**
*
*
*
*
*
*/

/*picture slider in JQuirey*/
function cycleImages() {
    var images = $('#banner_area img'),
        now = images.filter(':visible'),
        next = now.next().length ? now.next() : images.first(),
        speed = 1000;

    now.fadeOut(speed);
    next.fadeIn(speed);
}

$(function () {
    setInterval(cycleImages, 1400);
});

/***********************************************************************/

 if(document.images){
               var image1 = new Image(); // Preload an image
               image1.src = "/images/html.gif";
               var image2 = new Image(); // Preload second image
               image2.src = "/images/http.gif";
               var image3 = new Image();
               image3.src = "";
               var image4 = new Image();
               image4.src = "";
            }		
			
	/**********************************************/		
			
function loadDoc() {
  var callit;
  if (window.XMLHttpRequest) {
    // code for modern browsers
    callit = new XMLHttpRequest();
    } 
	else 
	{
    // code for IE6, IE5
    callit = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xhttp.onreadystatechange = function() 
  {
    if (callit.readyState == 4 && callit.status == 200) {
		document.getElementById("demo").innerHTML = callit.responseText;
    }
  };
  callit.open("GET", "../doc/ajax_text.txt", true);
  callit.onreadystatechange("GET","ajax_text.txt", true);
  callit.send();
}

/***************************************/

$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideDown(5000);
    });
    $("#stop").click(function(){
        $("#panel").stop();
    });


$("#flip").click(function(){
        $("#pane2").slideDown(5000);
    });
    $("#stop").click(function(){
        $("#pane2").stop();
    });

$("#flip").click(function(){
        $("#pane3").slideDown(5000);
    });
    $("#stop").click(function(){
        $("#pane3").stop();
    });

$("#flip").click(function(){
        $("#pane4").slideDown(5000);
    });
    $("#stop").click(function(){
        $("#pane4").stop();
    });

$("#flip").click(function(){
        $("#pane5").slideDown(5000);
    });
    $("#stop").click(function(){
        $("#pane5").stop();
    });
});



/*The script that helps to close the opened page when we hover onther page before 
before we close the one we open already.
$("about").hover(function(){
	$('#contactdiv').slideUp('fast');
	$('#aboutdiv').slideUp('slow');
	$('#instructiondiv').slideUp('slow');
	$('#about').stop(true,true).slideDown('slow');
	},
	function(){
		$('#about').stop(true,true).slideUp('slow');
		});

*/

$(document).ready(function() {
	
 /*the direction of boots script goes here*/   
});





$(document).ready(function() {
	
        $("#about").click(function () {
            if ($('#aboutdiv').is(":hidden")) {
			    $('#contactdiv').slideUp('slow');
                $('#instructiondiv').slideUp('slow');
                $("#aboutdiv").slideDown('slow');
            } else {
			    $('#contactdiv').slideUp('slow');
				$('#instructiondiv').slideUp('slow');
                $('#aboutdiv').slideUp('slow');

            }
        });
		
		$("#contact").click(function () {
            if ($('#contactdiv').is(":hidden")) {
				$('#aboutdiv').slideUp('slow');
                $('#instructiondiv').slideUp('slow');
                $("#contactdiv").slideDown('slow');
            } else {
				$('#aboutdiv').slideUp('slow');
                $('#instructiondiv').slideUp('slow');
                $('#contactdiv').slideUp('slow');

            }
        });
		
		$("#instruction").click(function () {
            if ($('#instructiondiv').is(":hidden")) {
				$('#contactdiv').slideUp('slow');
				$('#aboutdiv').slideUp('slow');
                $("#instructiondiv").slideDown('slow');
            } else {
				$('#contactdiv').slideUp('slow');
				$('#aboutdiv').slideUp('slow');
                $('#instructiondiv').slideUp('slow');

            }
        });
});



