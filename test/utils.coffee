jsdom = require('jsdom').jsdom

module.exports =
  inject: (markup) -> global.document = jsdom markup
  all: (selector) -> document.querySelectorAll(selector)
  one: (selector) -> document.querySelectorAll(selector)[0]
  # body: -> document.body
