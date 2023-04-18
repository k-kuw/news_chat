class MessagesController < ApplicationController
  # メッセージ作成
  def create
    # ログインユーザーの許可されたパラメータ(message_params)でのメッセージ作成
    message = @current_user.messages.build(message_params)
    # action cableの使用
    ActionCable.server.broadcast("chat_channel", { message: render_message(message), username: @current_user.username }) if message.save
  end

  private

  # メッセージパラメータの保存許可、記事id追加
  def message_params
    params.require(:message).permit(:content).merge(article_id: params[:article_id])
  end

  # リアルタイムでのメッセージの更新
  def render_message(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message })
  end
end
