import consumer from "channels/consumer";

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    // ログインユーザーの情報取得
    const loginUser = $("#login_user").text()

    // メッセージを追加したユーザーとログインユーザーが一致する場合、スタイル変更
    if(data.username === loginUser) {
      const revisedMessage = data.message.replace('white', 'teal lighten-4').replace('push-s1', 'push-s7').replace('<small>', '<div class="right-align"><small>').replace(/<small id="name">(.*)<\/small>/, '<small>me</small></div>')
      $("#message_list").append(revisedMessage);
    } else {
      $("#message_list").append(data.message);
    }
    // 最新メッセージを見れるようにする
    $("#message_list").scrollTop($("#message_list")[0].scrollHeight);
    // メッセージをした際に入力欄を空にする
    $("#message_text").val("");
  },
});
