$(document).ready(function() {
  $(document).on("load", "#waiting", function() {
    var data = "user_id="+$(this).data("id");
    $.post("/refresh", data, function(response) {
      $(".container").html(response);
    });
  });
});
