# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("select[id^='grid']").each(function() {
  $(this).onchange(function() {
    $('#ttt_form').submit();
    $(this).prop('disabled', true);
    $('input#'+$(this).id).val($(this).val());
    $('input#'+$(this).id).prop('disabled', false);
  })();
});
