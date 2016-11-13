$('.delete').bind 'ajax:success', ->
  $(this).closest('li').remove()
  return