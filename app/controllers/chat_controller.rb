require 'multipart'

class ChatController < ApplicationController
  before_filter :default_serialization_method
  before_filter :check_for_oauth

  def send_message
    if request.method == :post
      @query = "/chat/send_message.#{@serialization_method}"
      @result = justintv_oauth_post(@query, "message" => params[:message])
    end
  end
  
  def create_namespace_chatroom
    #@result = true
    if request.method == :post
      @query = "/chat/create_namespace_chatroom/#{params[:room_name]}.#{@serialization_method}"
      @result = justintv_oauth_two_legged_get(@query)
    end
  end
  
  def destroy_namespace_chatroom
    if request.method == :post
      @query = "/chat/destroy_namespace_chatroom/#{params[:room_name]}.#{@serialization_method}"
      @result = justintv_oauth_two_legged_get(@query)
    end
  end
  
  def list_namespace_chatrooms
    if request.method == :post
      @query = "/chat/list_namespace_chatrooms.#{@serialization_method}"
      @result = justintv_oauth_two_legged_get(@query)
    end
  end
end