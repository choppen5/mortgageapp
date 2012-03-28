Namespace('rcrm');

(function(self) {


  self.extend({
    init: function() {
      rcrm.dashboard.init();
    }
  });

})(rcrm);



$( function() { rcrm.init();  });