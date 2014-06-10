ready = ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.row-remove', (event) ->
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

  $('form').on 'click', '.row-edit', (event) ->
    url = $(this).data("edit-url")
    div = $("#"+$(this).data("target"))
    params = {}
    div.find("input[data-name]").each (index) ->
      params[$(this).data('name')] = $(this).val()
    console.log(params)
    $.get url, params, (data, textStatus, jqXHR) ->
      $('#mainModal .modal-body').html(data)
      $('#mainModal .btn-primary').one 'click', ->
        #$.post url, $('#mainModal form').serialize, (data, textStatus, jqXHR) ->
        #  alert(data)
        alert $('#mainModal form').serialize()
      $('#mainModal').modal()


$(document).ready(ready)
$(document).on('page:load', ready)