$(document).on 'click', 'a:not([type="submit"])', (event) ->
  #console.log($.attr(this, 'href').substring(0, 1))
  if $.attr(this, 'href').substring(0, 1) == '#'
    event.preventDefault()
    $('html, body').stop().animate {
      scrollTop: ($($.attr(this, 'href')).offset().top -200)
      easing: 'swing'
    }, 500
  return
