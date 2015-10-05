module.exports = (node, attr = 'data-tu') ->
  while node = node.parentElement
    return node if node.hasAttribute attr
