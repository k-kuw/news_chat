class MessagesController < ApplicationController
  def create
    message = @current_user.messages.build(message_params)
    ActionCable.server.broadcast("chat_channel", { message: render_message(message), username: @current_user.username }) if message.save
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(article_id: params[:article_id])
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message })
  end
end
