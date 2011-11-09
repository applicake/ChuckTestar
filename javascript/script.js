function mousein() {
  $("#subtitle, #nope").toggle();
  $("#instructions").addClass("hover");
}

function mouseout() {
  $("#subtitle, #nope").toggle();
  $("#instructions").removeClass("hover");
}

$(function() {
  $("#instructions ul").hover(mousein, mouseout);
})
