window.onload = function() {
  $("select[id^='grid']").change(function() {
		$('#ttt_form').submit();
		$('input#'+$(this).attr('id')).val($(this).val());
		$('input#'+$(this).attr('id')).prop('disabled', false);
		$(this).prop('disabled', true);
  });
};
