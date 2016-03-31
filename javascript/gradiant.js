// JavaScript Document
//Abraham Ewnetu


var colors = new Array(
  [62,35,255],
  [60,255,60],
  [255,35,98],
  [45,175,230],
  [255,0,255],
  [255,128,0]);
/*
var images = new Array(
       [image1.png,image2.png,image3.png,image4.png],
       [image5.png,image6.png,image7.png,image8.png],
       [image9.png,image10.png,image11.png,image12.png],
       [image13.png,image14.png,image15.png,image16.png],
       [image17.png,image18.png,image19.png,image20.png],
       [image21.png,image22.png,image23.png,image24.png],
);
*/

var imageStep = 0;
var imageIndices = [0,1,2,3,4];
var imageGradientSpeed = 0.003;
/*
function imageUpdateGradient(){

  if( $==undefined) 
    return;

  var image_0 = images[imageIndices[0]];
  var image_1 = images[imageIndices[1]];
  var image_0 = images[imageIndices[2]];
  var image_1 = images[imageIndices[3]];

  var imageStep = 1 - step;
  var  i_1 = Math.round(imageStep*image_0[0]+step*image_0[0]);
  var  i_2 = Math.round(imageStep*image_0[1]+step*image_0[1]);
  var  i_3 = Math.round(imageStep*image_0[2]+step*image_0[2]);
  var image1 = "image("+i_1+","+i_2+","+i_3+")";

  var imageStep = 1 - step;
  var  im_1 = Math.round(imageStep*image_0[0]+step*image_0[0]);
  var  im_2 = Math.round(imageStep*image_0[1]+step*image_0[1]);
  var  im_3 = Math.round(imageStep*image_0[2]+step*image_0[2]);
  var image2 = "image("+im_1+","+im_2+","+im_3+")";
  $('#gradient').css({
    background:"-webkit-gradient(linear,left top,right top,from(),())"}).css({
      background:"-moz-linear-gradient(linear, left top,right top,from(),())"});
    });
  });

}
*/
var step = 0;
//color table indices for: 
// current color left
// next color left
// current color right
// next color right
var colorIndices = [0,1,2,3];

//transition speed
var gradientSpeed = 0.002;

function updateGradient()
{
  
  if ( $===undefined ) return;
  
var c0_0 = colors[colorIndices[0]];
var c0_1 = colors[colorIndices[1]];
var c1_0 = colors[colorIndices[2]];
var c1_1 = colors[colorIndices[3]];

var istep = 1 - step;
var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
var color1 = "rgb("+r1+","+g1+","+b1+")";

var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
var color2 = "rgb("+r2+","+g2+","+b2+")";

 $('#gradient').css({
   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});
  
  step += gradientSpeed;
  if ( step >= 1 )
  {
    step %= 1;
    colorIndices[0] = colorIndices[1];
    colorIndices[2] = colorIndices[3];
    
    //pick two new target color indices
    //do not pick the same as the current one
    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
    
  }
}

setInterval(updateGradient,10);