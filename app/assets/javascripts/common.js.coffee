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
      div.find('.row-data input[type!=hidden]').removeAttr('disabled')
    else
      fld.val('1')
      div.addClass('destroyed')
      div.find('.row-data input[type!=hidden]').attr('disabled', 'disabled')

  $('form').on 'click', '.row-edit', (event) ->
    url = $(this).data("edit-url")
    div = $("#"+$(this).data("target"))
    params = {}
    div.find("*[data-name]").each (index) ->
      params[$(this).data('name')] = $(this).val()
    $.get url, params, (data, textStatus, jqXHR) ->
      modal = $('#mainModal')
      modal.find('.modal-body').html(data)
      modal.find('.btn-primary').one 'click', ->
        q = modal.find('*').filter(':input').serialize()
        $.post url, q, (data, textStatus, jqXHR) ->
          div.replaceWith(data)
          modal.find('.btn-default').off
          modal.modal('hide')

      $('#mainModal').one 'hidden.bs.modal', ->
        $('#mainModal').find('.btn-primary').unbind 'click'

      $('#mainModal').modal()

$(document).ready(ready)
$(document).on('page:load', ready)