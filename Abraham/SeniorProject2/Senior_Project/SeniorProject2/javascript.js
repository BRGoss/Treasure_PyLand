/*Abraham Ewnetu*/

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



