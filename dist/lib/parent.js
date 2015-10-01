var parent;

parent = function(node, attr) {
  var father;
  if (attr == null) {
    attr = 'data-tu';
  }
  father = node.parentElement;
  switch (false) {
    case !!father:
      return null;
    case !father.hasAttribute(attr):
      return father;
    default:
      return parent(father);
  }
};

module.exports = parent;
