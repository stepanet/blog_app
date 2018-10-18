# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(document).on "turbolinks:load", ->
    return unless $(".posts.index").length > 0
    $("#post_name").autocomplete({
        source: (request, response) ->
            $.ajax({
                url: "/autocompletes/posts"
                dataType: 'json'
                data: {"term": request.term}
                success: (dataresponse) ->
                  response(dataresponse)
            })
        delay: 500
        minLength: 1
        open: (event, ui) ->
            $('.ui-autocomplete').off('menufocus hover mouseover mouseenter');
        select: (a, b) ->
            a.preventDefault()
            $(this).val(b.item.label).blur()
            $($(this).data("value")).val(b.item.value)
            window.location.href = "/posts/" + b.item.value
        })
    $(".search-post .btn").click ->
            $.ajax({
                url: "/posts?post_name=" + $("#post_name").val()
                dataType: 'script'
            })
