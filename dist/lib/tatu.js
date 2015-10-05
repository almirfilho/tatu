var parent, tatu;

parent = require('./parent');

tatu = function(node, attr) {
  var el, elements, i, internal, len, prop, result;
  if (attr == null) {
    attr = 'data-tu';
  }
  elements = node.querySelectorAll("[" + attr + "]");
  internal = false;
  if (node.hasAttribute(attr)) {
    if (!elements.length) {
      return node.textContent;
    }
    internal = true;
  }
  elements = Array.prototype.filter.call(elements, function(el) {
    if (internal) {
      return parent(el) === node;
    } else {
      return !parent(el);
    }
  });
  result = {};
  for (i = 0, len = elements.length; i < len; i++) {
    el = elements[i];
    prop = el.getAttribute(attr);
    if (prop in result) {
      if (!(result[prop] instanceof Array)) {
        result[prop] = [result[prop]];
      }
      result[prop].push(tatu(el));
    } else if (prop) {
      result[prop] = tatu(el);
    }
  }
  return result;
};

module.exports = tatu;
