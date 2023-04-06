// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery";
import "materialize";

$(document).on("turbo:load", function () {
  $("#delete_button").on("click", function () {
    const flash_message = document.getElementById("flash_message");
    flash_message.remove();
  });
});

$(function () {
  $("select").formSelect();
});
