tatu = (node, attr = 'data-tu') ->
  elements = node.querySelectorAll "[#{attr}]"
  return node.textContent if not elements.length and node.hasAttribute attr

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