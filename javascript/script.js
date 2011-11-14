function mousein() {
  $("#subtitle").hide();
  $("#nope").show();
  $("#pigbird, #crocoduck, #squieagle").addClass("hover");
}

function mouseout() {
  $("#subtitle").show();
  $("#nope").hide();
  $("#pigbird, #crocoduck, #squieagle").removeClass("hover");
}

$(function() {
  $("#instructions ul").hover(mousein, mouseout);
})
