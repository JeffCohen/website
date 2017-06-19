$(function() {
  $("#show-mockup").on("click", function(e) {
    e.preventDefault();
    $("#mockup").toggle();
  });
  $("form").on("submit", function(e) {
    e.preventDefault();
    var phrase = $("input[name=phrase]").val();
    $("form")[0].reset();

    if (phrase === "Curiosity" || phrase === "curiosity") {
      $(".alert").removeClass("alert-danger").addClass("alert-success");
      $(".alert").html("Congratulations, you did it!<br><strong>TO COMPLETE THIS ASSIGNMENT:</strong> Use \"Curiosity\" as the content of the <code>&lt;title&gt</code> element of your page.");
      $(".alert").show();
    } else {
      $(".alert").removeClass("alert-success").addClass("alert-danger");
      $(".alert").text("Nope... keep trying! (There's a hint somewhere in this page)");
      $(".alert").show();
    }
  })
})
