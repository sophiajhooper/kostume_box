class MessagesController < ApplicationController
  before_action :current_user_must_be_message_sender,
                only: %i[edit update destroy]

  before_action :set_message, only: %i[show edit update destroy]

  def index
    @q = current_user.sent_messages.ransack(params[:q])
    @messages = @q.result(distinct: true).includes(:sender, :receiver,
                                                   :costume).page(params[:page]).per(10)
  end

  def show; end

  def new
    @message = Message.new
  end

  def edit; end

  def create
    @message = Message.new(message_params)

    if @message.save
      message = "Message was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @message, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    message = "Message was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to messages_url, notice: message
    end
  end

  private

  def current_user_must_be_message_sender
    set_message
    unless current_user == @message.sender
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :message_text,
                                    :costume_id)
  end
end
