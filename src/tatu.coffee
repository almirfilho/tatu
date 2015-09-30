parent = require './parent'

tatu = (node, internal = false, attr = 'data-tu') ->
  elements = node.querySelectorAll "[#{attr}]"
  return node.textContent if not elements.length and node.hasAttribute attr

  unless internal
    elements = Array.prototype.filter.call elements, (el) -> not parent el

  result = {}

  for el in elements
    prop = el.getAttribute attr

    if prop of result
      result[prop] = [result[prop]] unless result[prop] instanceof Array
      result[prop].push tatu el, true
    else if prop
      result[prop] = tatu el, true

  result

module.exports = tatu