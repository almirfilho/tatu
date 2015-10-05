module.exports = function(node, attr) {
  if (attr == null) {
    attr = 'data-tu';
  }
  while (node = node.parentElement) {
    if (node.hasAttribute(attr)) {
      return node;
    }
  }
};
