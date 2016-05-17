$(function(){ // If you are not familiar with jQuery, this will run when the page is loaded and ready
  $('#Try_Again').click(function(){
  	$('#Errors').val('');
    $('#Test_Failure').hide('slow'); 
    $('#Result_Box').hide('slow');
  });
});

$(document).ready(function() {
var imagePaths = ["treasureislandtitle.png","treasureislandboat.png",
                  "treasureislan2.png","scaleton.png","piratebox.png","map.png","sphere.png"];
                  //"treasureisland.png"

var canvas  = document.querySelector('canvas'),
    context  = canvas.getContext('2d'),
    loadedImages = []; 

imagePaths.forEach(function(path){
  var picture = new Image;
  picture.onload = function(){
    loadedImages.push(picture);
  }
  // Simulate really slow loading of images
  setTimeout(function(){
    picture.src = "/assets/images/" + path;
  },Math.random()*10000);
});

Math.APPLIEDFORMULA = Math.PI*2; 

setInterval(function(){ animateInCircle(context,loadedImages) }, 30);

//Hellps to resize canvas uniformly with cascading style sheet size
(window.onresize = function(){
  canvas.width  = canvas.offsetWidth;
  canvas.height = canvas.offsetHeight;
})();

function animateInCircle(context,images){
  context.clearRect(0,0,context.canvas.width,context.canvas.height);
  var contextx = context.canvas.width/2,
      contexty = context.canvas.height/2;

  // equation that make sure the size of the circle is greater than the image if not faill to display
  var maximumWidth = Math.max.apply(Math,images.map(function(picture){
    return picture.width;
  }));
  var enlargment = 1.0;
  var circumference = estimateCircumference()*enlargment;
  var radius = Math.max( circumference/Math.APPLIEDFORMULA, maximumWidth/2 );

  var limitedAngle=0, limitationOfHalf=0;
  images.forEach(function(picture,i){
    limitedAngle += limitationOfHalf;
    limitationOfHalf = Math.APPLIEDFORMULA * (picture.height/2) * enlargment / circumference;
    limitedAngle += limitationOfHalf;
    context.save();
    context.translate(contextx,contexty);
    context.rotate((limitedAngle+(new Date)/3000)%Math.APPLIEDFORMULA);
    context.translate(radius-picture.width/2,-picture.height/2);
    context.drawImage(picture,0,0);
    context.restore();
  });

  function estimateCircumference(){
    var estCircumference = 0;
    images.forEach(function(picture){
      estCircumference += picture.height;
    })
    return estCircumference;
  }
}

});
