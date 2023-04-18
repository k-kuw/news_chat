// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery";
import "materialize";
import "channels";

$(document).on("turbo:load", function () {
  // flashメッセージの削除ボタン
  $("#delete_button").on("click", function () {
    $("#flash_message").remove();
  });
  
  // 初期表示で最新メッセージの表示
  if ($("#message_list").length > 0) {
    $("#message_list").scrollTop($("#message_list")[0].scrollHeight);
  }

  // MaterializeCSSの初期化
  $(function () {
    $("select").formSelect();
  });

  // 記事追加/編集画面の画像表示
  $("#article_photo").on("change", function (e) {
    // すでに画像が表示されており、画像を変更した場合に、前の画像を削除
    if($("attached_file")) {
      $("#attached_file").remove()
    }

    // 画像の取得、URL化
    const file = e.target.files[0];
    const imageUrl = URL.createObjectURL(file);

    // 画像の表示
    $("#image_file").append(`<img src=${imageUrl} width="100" height="100" id="attached_file">`);
  });
});
