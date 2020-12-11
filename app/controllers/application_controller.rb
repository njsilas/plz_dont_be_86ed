require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "work_in_progress"
  end

  get "/" do
    redirect to '/home'
  end
  get '/home' do
    erb :'/home'
  end
  
  
  helpers do
    def current_server
      @current_server ||= Server.find_by(:id => session[:server_id]) if session[:server_id]
    end
    def is_logged_in?
      !!current_server
    end
  end
  def present_time
    x = Time.new
     x.strftime("%I:%M %p") 
  end
  def servers_orders
    
  end
end
