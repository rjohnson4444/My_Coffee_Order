$(document).ready(function(){
  $('.slider').slider({ indicators: false });
  $('.collapsible').collapsible({ accordion : false });


  $('#status-ordered').on('click', function () {
  $status = $('.order')
  var currentStatus = 'ordered'
  $status.each(function (index, order) {
    $status = $(order);
    if ($status.data('status') === currentStatus) {
      $status.show();
    } else {
      $status.hide();
    }
    });
  });


  $('#status-paid').on('click', function () {
  $status = $('.order')
  var currentStatus = 'paid'
  $status.each(function (index, status) {
    $status = $(status);
    if ($status.data('status') === currentStatus) {
      $status.show();
    } else {
      $status.hide();
    }
    });
  });

  $('#status-cancelled').on('click', function () {
  $status = $('.order')
  var currentStatus = 'cancelled'
  $status.each(function (index, status) {
    $status = $(status);
    if ($status.data('status') === currentStatus) {
      $status.show();
    } else {
      $status.hide();
    }
    });
  });

  $('#status-completed').on('click', function () {
  $status = $('.order')
  var currentStatus = 'completed'
  $status.each(function (index, status) {
    $status = $(status);
    if ($status.data('status') === currentStatus) {
      $status.show();
    } else {
      $status.hide();
    }
    });
  });
});
