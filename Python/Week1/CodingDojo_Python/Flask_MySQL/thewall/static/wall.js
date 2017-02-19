$(document).ready(function() {
  console.log("hello world!");
  $(".editbox").hide();
  $(document).on("click", "#edit", function() {
    console.log("Edit");
    $(this).parent().siblings('.editbox').show();
    $(this).parent().siblings('.editbox').children('textarea').val($(this).parent().siblings('p').text());
    $(this).parent().siblings('p').hide();
    $(this).hide();
  });
});
