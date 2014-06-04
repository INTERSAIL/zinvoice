ready = ->
  console.log('binding')

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.row-remove', (event) ->
    console.log('click' + $(this).data("target"))
    div = $("#"+$(this).data("target"))
    fld = div.find("input[data-destroy-field=1]")
    if(fld.val() == '1')
      fld.val('0')
      div.removeClass('destroyed')
      div.find('.row-data input').removeAttr('disabled')
    else
      fld.val('1')
      div.addClass('destroyed')
      div.find('.row-data input').attr('disabled', 'disabled')



$(document).ready(ready)
$(document).on('page:load', ready)