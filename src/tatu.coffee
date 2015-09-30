module.exports = (node, attr = 'data-tu') ->
  result = {}

  for el in node.querySelectorAll "[#{attr}]"
    prop = el.getAttribute attr

    if prop of result
      result[prop] = [result[prop]] unless result[prop] instanceof Array
      result[prop].push el.textContent
    else if prop
      result[prop] = el.textContent

  result
