// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// $(document).ready(function(){
// 	document.getElementsByTagName('input')[0].focus();
// });

$(document).live('click', function(e) {
  	if($(e.target).is("#real_search_input")) {
		if($("#real_search_tip").length <= 0) {		
			$("#search_topics").append(
				'<p></p><div class="container-fluid" id="real_search_tip" style="display: hide"><h4 id="real_tips_sba">Tip: Please search existing topics before you add a new one.</h4></div>'
			);
		}
  	}
	else {
			$("#real_search_tip").remove();	
	}
});

// $('body').ajaxComplete(function(event, xhr, options) {
// 		//$("#real_tips_sba").remove();
// 		//$("#real_search_tip").append(xhr.responseHTML);
// 	}
// )