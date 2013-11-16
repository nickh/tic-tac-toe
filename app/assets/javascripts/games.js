$(document).ready(function() {
  var turn=0;
  $("div[id^='grid']").click(function() {
	var id = $(this).attr('id'),
	    square = $('div#'+id);
	if (square.hasClass("available")) {
	  square.removeClass("available");
	  xo = turn % 2 ? 'O' : 'X';
	  square.html(xo);
	  $('input#'+id).val(xo);
	  $('#ttt_form').submit();
	  turn++;
	}
  });
});
