$(function() {

var test = function(val) {
  $('#menu').append("Test Working - id is " + val + "<br>")
}

$('#updater').on('ajax:success', function(evt, data, status, xhr) {
   console.log(data);
 });

});

// $('#update').on('click', function(e) {
// alert('click');
// });