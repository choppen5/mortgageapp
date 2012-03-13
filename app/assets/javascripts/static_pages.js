var app = {
  initialize: function() {
    $('.company').click(function(){
      var cid = $(this).attr('data-company-id');
      $('.hidden').html("<input type='hidden' name='micropost[company_id]' value='" + cid + "' />");

      $('.company').removeClass('btn-info');
      $(this).addClass('btn-info');
    });
  }
};

$(app.initialize);