jQuery(document).ready(function () {
	
    jQuery('.hover-edit-element').hoveredit({
    	saveCallback: saveElement,
    	autoresize: false
    });
})

saveElement = function (wrapper, form_element, old_value) {
	
	// Ajax call to save edited description.
	
	window.setTimeout(function () {wrapper.hoveredit('success')}, 1000);
}