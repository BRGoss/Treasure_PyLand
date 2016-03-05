// JavaScript Document
//Abraham Ewnetu


var main = function() {
 (document).keypress(function(event) {
    if(event.which === 109) {
    $('.dropdown-menu').toggle();
     }
   });
};

$(document).ready(main);

