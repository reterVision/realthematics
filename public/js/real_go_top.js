
$(document).ready(function(){
	// "go to top" link on window scroll
	var topdistant = false;

	function getScrollY() {
		var scrOfY = 0; //, scrOfX = 0;
		if( typeof( window.pageYOffset ) == 'number' ) {
			scrOfY = window.pageYOffset; //scrOfX = window.pageXOffset;
		} else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
			scrOfY = document.body.scrollTop; //scrOfX = document.body.scrollLeft;
		} else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
			scrOfY = document.documentElement.scrollTop; //scrOfX = document.documentElement.scrollLeft;
		}
		return scrOfY;
	}

	function topDistanceCrosses(){
		if (getScrollY() > 200 && !topdistant) {
			topdistant = true;
			$("#toplink").slideDown('slow');
			return 1 ; // going down
		}
		else if(getScrollY() < 200 && topdistant ) {
			topdistant = false;
			$("#toplink").slideUp('fast');
			return 2; // going up
		}
		else {
			return 0; // nothing happens
		}
	}
		
	$(document).bind("scroll", topDistanceCrosses);
	$('#toplink').bind("click", function(){
		$("html, body").animate({ scrollTop: 0 }, "slow");
		return false;
	});
});
