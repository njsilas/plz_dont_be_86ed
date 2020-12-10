class ServerController < ApplicationController  
  get '/logout' do
    session.clear
    redirect '/'
  end
  get '/log_in' do
   if !is_logged_in?
    erb  :'/servers/log_in'
   else
    redirect to '/servers/:id'
   end
 end
  post '/log_in' do
    server = Server.find_by_name(params[:name])
    if server && server.authenticate(params[:password])
      session[:server_id] = server.id
      redirect to '/servers/:id'
    else
      redirect to '/log_in'
    end
  end
  get '/servers/new' do 
    if !is_logged_in?
      erb :'servers/new'
    else 
      redirect to '/servers/show'
    end
  end
  post '/servers/new' do
    server = Server.new(params)
    if server.password.blank? || server.name.blank?
      redirect to '/servers/new'
    else
       server.save
       session[:server_id] = server.id
      
       redirect to '/servers/:id'
    end
  end
    #get '/servers' do
    #@servers = server.all
   # erb :'/servers/index' 
  #end
    
  #get '/servers/new' do 
  #  if !is_logged_in?
      #erb :'/servers/new'
   # else
      #redirect to '/servers/show'
    #end
  #end
    
  #post '/servers' do
  #end
     
  get '/servers/:id/edit' do 
    @server = server.find(params[:id])
    erb :'/servers/edit'
  end
    
  get '/servers/:id' do 
    @server = Server.find_by_id(params[:id])
    erb :'/servers/show'
  end
    
  patch '/servers/:id' do 
       
  end
  
  delete '/servers/:id' do
  end

end