limit_chars = (el, limit)->
  el = $(el)
  console.log el.val()
  console.log el.val().length
  if el.val().length > limit
    el.val(el.val().substr(0, limit))

$ ->
  $('.large-input').bind 'keyup', ()->
    limit_chars(this, 250)
