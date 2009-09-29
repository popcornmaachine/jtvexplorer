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
  
  def list_callbacks
    if request.method == :post
      @query = "/stream/list_callbacks.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  def register_namespace_callback
    if request.method == :post
      @query = "/stream/register_namespace_callback.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  
  def unregister_namespace_callback
    if request.method == :post
      @query = "/stream/unregister_namespace_callback.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  
  def list_namespace_callbacks
    if request.method == :post
      @query = "/stream/list_namespace_callbacks.#{@serialization_method}" 
      @result = justintv_oauth_two_legged_post(@query, params)
    end
  end
  def list
    p = { "offset" => params[:offset], "limit" => params[:limit]}
    p[:namespace] = params[:namespace] if not params[:namespace].blank?
    p[:channel] = params[:login] if not params[:login].blank?
    p[:category] = params[:category] if not params[:category].blank? and params[:category] != "(ALL)" 
    p = p.to_params
    
    if request.method == :post
      @query = "/stream/list.#{@serialization_method}?#{p}"
      @result = justintv_get(@query)
    end
  end
end