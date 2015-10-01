var parent, tatu;

parent = require('./parent');

tatu = function(node, internal, attr) {
  var el, elements, i, len, prop, result;
  if (internal == null) {
    internal = false;
  }
  if (attr == null) {
    attr = 'data-tu';
  }
  elements = node.querySelectorAll("[" + attr + "]");
  if (!elements.length && node.hasAttribute(attr)) {
    return node.textContent;
  }
  if (!internal) {
    elements = Array.prototype.filter.call(elements, function(el) {
      return !parent(el);
    });
  }
  result = {};
  for (i = 0, len = elements.length; i < len; i++) {
    el = elements[i];
    prop = el.getAttribute(attr);
    if (prop in result) {
      if (!(result[prop] instanceof Array)) {
        result[prop] = [result[prop]];
      }
      result[prop].push(tatu(el, true));
    } else if (prop) {
      result[prop] = tatu(el, true);
    }
  }
  return result;
};

module.exports = tatu;
