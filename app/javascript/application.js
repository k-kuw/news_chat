// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery";
import "materialize";

const scroll_bottom = function () {
  if ($("#message_list").length > 0) {
    $("#message_list").scrollTop($("#message_list")[0].scrollHeight);
  }
};

$(document).on("turbo:load", function () {
  $("#delete_button").on("click", function () {
    $("#flash_message").remove();
  });
  scroll_bottom();
  $(function () {
    $("select").formSelect();
  });
});


import "channels";
