$(document).ready(function() {
  var turn=0;
  $("div[id^='grid']").click(function() {
	if ($('div#'+$(this).attr('id')).html() == "") {
	  xo = turn % 2 ? 'O' : 'X';
	  $('div#'+$(this).attr('id')).html(xo);
	  $('input#'+$(this).attr('id')).val(xo);
	  $('#ttt_form').submit();
	  turn++;
	}
  });
});
