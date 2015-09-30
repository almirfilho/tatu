parent = (node, attr = 'data-tu') ->
  father = node.parentElement
  switch
    when not father then null
    when father.hasAttribute attr then father
    else parent father

module.exports = parent