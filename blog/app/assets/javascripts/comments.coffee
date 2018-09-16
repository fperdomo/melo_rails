# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success","form#comments-form",(ev)->
		# console.log ev.detail[0]
		$(this).find("textarea").val("")
		# $("#comments-box").append("<li> #{ev.detail[0].body} - #{ev.detail[0].user.email} </li>")

		
$(document).on "ajax:error","form#comments-form",(ev)->
	console.log ev.detail[0]