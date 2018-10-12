$(function() {
  $('.dynamicMenu').hide();
  $('.dynamicMenu').first().show();

  $('#sideNav').find('a').click(function(e) {
    e.preventDefault();
    $('.dynamicMenu').hide();
    var menu = $(this).find('span').data('menu');
    $('#' + menu).show();
  });
});