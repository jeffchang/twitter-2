$(document).ready(function() {
  if ($('#waiting').length > 0) {
    var data = "username=" + username;
    $.post("/refresh", data, function(response) {
      $(".container").html(response);
    });
  }
});

