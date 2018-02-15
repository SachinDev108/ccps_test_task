# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

displayResponse = (str, status) ->
  $('.info-body').html str
  $('.info-code').html status
  return

setValParam = (value) ->
  str = JSON.stringify(value, undefined, 4)
  $('#parameters_body').html str
  return

$(document).ready ->
  myJsObj = 
    'type': 'sale'
    'attributes':
      'item': 'Demo Item'
      'date_of_transaction': '2015-06-11T11:34+01:00'
      'source': ''
      'price': '25'
    'relationships': 'customer': 'data':
      'customer_number': 'ffgrgrttttgggg'
      'name': 'John'
      'surname': 'Roy'
  setValParam myJsObj
  return

$(document).on 'change', '#source', ->
  val = $(this).val()
  request_url = 'api/v1/sales?source=' + val
  $('.info-box').html '<p>' + request_url + '</p>'
  return  

$(document).on 'click', '.submit-btn', ->
  dataVal = JSON.parse($('#parameters_body').val())
  if dataVal.attributes.source == ""
    alert('Please add source');
    return
  dataParam = $('#parameters_body').val()
  $.ajax
    url: '/api/v1/sales'
    dataType: 'json'
    contentType: 'application/json;charset=utf-8'
    type: 'post'
    data: dataParam
    success: (data, textStatus, xhr) ->
      str = JSON.stringify(data, undefined, 4)
      displayResponse str, xhr.status
      return
    error: (data) ->
      str = JSON.stringify(data.responseJSON)
      displayResponse str, data.status
      return
  return

  