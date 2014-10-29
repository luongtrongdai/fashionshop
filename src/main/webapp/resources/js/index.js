jQuery(document).ready(function($) {
	$('#slider').before('<div id="sliderthumbs" class="sliderthumbs">').cycle({
		pager:  '#sliderthumbs'  
	});
});