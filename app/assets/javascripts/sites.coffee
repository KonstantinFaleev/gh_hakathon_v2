# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', () ->
  @refreshData = () ->
    $.ajax("/refresh", {
      method: 'GET'
    })
  $('.choose-site').on('click', (e) ->
    target = $(e.target)
    siteId = target.data('id')
    $.ajax({
      url: "/sites/#{siteId}",
      method: 'GET'
    })
  )
)