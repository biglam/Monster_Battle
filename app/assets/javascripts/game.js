$("#style").click(function(){
	var items = ['style_original.css', 'style_stadium.css'];
   var item = items[Math.floor(Math.random()*items.length)];
   $("head").append("<link rel='stylesheet' href='" + item + "' type='text/css' media='screen'>");
});

$('p1-damage').on('ended',function(){ 
	$(this).hide();
});

$("#play-video").click(function(){
	$('#wrapper').show(); 
	$("#vid1").html('<source src="videos/carizard-flame.mp4" type="video/mp4"></source>' );
	$("#wrapper video")[0].load();
	$('#vid1').show(); 

});


$('video').on('ended',function(){ 
	$(this).hide();
	 $('#wrapper').hide();
});

