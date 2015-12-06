$(function() {

var test = function(val) {
  $('#menu').append("Test Working - id is " + val + "<br>")
}

$('#update').on("click", function(e) {
   e.preventDefault();
   alert('clicked');
 });

});