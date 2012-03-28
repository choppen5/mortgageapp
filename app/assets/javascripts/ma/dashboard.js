Namespace('rcrm.dashboard');

(function(self){

  var $$ = jqproxy(self);

  _.extend(self,{
    selectors: {
      showButtons: '.user-case a.js-show',
      deleteButtons: '.user-case a.js-delete',
      activityTypeButtons: '.choose-activity-header .btn',
      activityTypeHiddenInput: '#case_activity_activity_type'
    },
    init: function(){
      bindCaseShowDelButtons();
      bindActivityTypeButtons();
    },

    els: $$
  });

  function bindActivityTypeButtons() {
    $$('activityTypeButtons').click(function(){
      $$('activityTypeHiddenInput').attr('value',$(this).html().toLowerCase());
      $$('activityTypeButtons').removeClass('btn-info');
      $(this).addClass('btn-info');
    })
  }

  function bindCaseShowDelButtons() {
    $$('showButtons').click(function() {
      alert('clicked');
      return false;
    });
    $$('deleteButtons').click(function() {
      $.ajax({

      });
      return false;
    });
  }
})(rcrm.dashboard);

/*
I bought my house in 2008 - for $300,000. It was a awesome, house, neighborhood, etc. Seemed like a great purchase.

The relestate market in Arizona has been tanking though.. getting worse and worse.

I saw that I qualified for the HAMP program, because my income is 35% of my housing cost if refinanced.

I started this mortgage application Process 2 months ago. I've been calling daily, but they still haven't finished my refi. Really frustrated.
*/