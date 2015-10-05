parent = require './parent'

tatu = (node, attr = 'data-tu') ->
  elements = node.querySelectorAll "[#{attr}]"
  internal = false

  if node.hasAttribute attr
    return node.textContent if not elements.length
    internal = true

  elements = Array.prototype.filter.call elements, (el) ->
    if internal then parent(el) is node else not parent el

  result = {}

  for el in elements
    prop = el.getAttribute attr

    if prop of result
      result[prop] = [result[prop]] unless result[prop] instanceof Array
      result[prop].push tatu el
    else if prop
      result[prop] = tatu el

  result

module.exports = tatu
