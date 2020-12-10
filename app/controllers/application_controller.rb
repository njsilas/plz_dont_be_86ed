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
      @current_server ||= Server.find_by(:id => session[:user_id]) if session[:id]
    end
    def is_logged_in?
      !!current_server
    end
  end
end
