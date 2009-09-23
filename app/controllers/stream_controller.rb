require 'multipart'

class StreamController < ApplicationController
  before_filter :default_serialization_method

  def new_stream_key
    if request.method == :post
      @query = "/stream/new_stream_key/#{params[:streamname]}.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_get(@query)
    end
  end
  
  def register_callback
    if request.method == :post
      @query = "/stream/register_callback.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  
  def unregister_callback
    if request.method == :post
      @query = "/stream/unregister_callback.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  
  def unregister_callback
    if request.method == :post
      @query = "/stream/unregister_callback.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  
  def list_callbacks
    if request.method == :post
      @query = "/stream/list_callbacks.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  def list
    p = { "offset" => params[:offset], "limit" => params[:limit]}
    if (params[:namespace] != nil and params[:namespace].strip != "")
      params[:namespace].strip!
      p.merge!(:namespace => (params[:namespace]))
    end
    p = p.to_params
    
    if request.method == :post
      if (params[:login] != "") # view just the channel?
        @query = "/stream/list.#{@serialization_method}?channel=#{params[:login]}"
      elsif (params[:category] == "(ALL)") # all?
        @query = "/stream/list.#{@serialization_method}?#{p}"
      else # a specific category
        @query = "/stream/list.#{@serialization_method}?category=#{params[:category]}&#{p}"
      end
      @result = justintv_get(@query)
    end
  end
end