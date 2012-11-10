ready = ->
	at = $("#account_thing")
	ati = $("#account_thing_icon")

	at.mouseover ->
		ati.addClass("icon-white")
	
	at.mouseleave ->
		ati.removeClass("icon-white")
	
	$("a[rel=popover]").popover()
	$(".tooltip").tooltip()
	$("a[rel=tooltip]").tooltip()
	$(".dropdown-toggle").dropdown()

$(document).ready(ready)
$(document).on('page:load', ready)