//inspired by http://shiriru.blogspot.com/2007/12/javascript-simulating-namespaces-part-2.html
function Namespace(sName) {

  var namespaces = sName.split('.') || [sName];
  var nlen = namespaces.length;

  var root = window;

  for (var i = 0; i < nlen; i++) {
    var ns = namespaces[i];


    if (typeof(root[ns]) === 'undefined') {
      root = root[ns] = {
        extend: $.extend,
        _alreadyRun: false,
        runOnce:function(fn){
          if(!self._alreadyRun) { fn(); };
          self._alreadyRun = true;
        }
      };
    }
    else
      root = root[ns];
  }

}

function jqproxy(objWithSelectorsProperty) {
  return function (selector, context, rootjQuery) {
    if (objWithSelectorsProperty &&
      objWithSelectorsProperty.selectors &&
      objWithSelectorsProperty.selectors[selector])
      return $(objWithSelectorsProperty.selectors[selector], context, rootjQuery);
    else
      return [];
  };
}
