# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  engine = new Bloodhound(
    datumTokenizer: (data) ->
      console.log data
      Bloodhound.tokenizers.whitespace data.title
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      wildcard: '%QUERY'
      url: '/snippets?query=%QUERY')
  promise = engine.initialize()
  promise.done(->
    console.log 'Typeahead Loaded properly'
    return
  ).fail ->
    console.log 'There was a problem with Typeahead'
    return

  $('.typeahead.snippets-search')
    .typeahead(null,
      name: 'engine'
      displayKey: 'title'
      source: engine.ttAdapter())
    .bind 'enter', ->
      $(this)
        .closest('.snippets-search-form')
        .submit()
    return
  return
