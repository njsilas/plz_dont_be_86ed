class OrderController < ApplicationController
      get '/orders' do
        @orders = order.all
        erb :'/orders/index' 
      end
    
      get '/orders/new' do 
        erb :'/orders/new'
      end
    
      post '/orders' do 
        @order = current_server.orders.build(params)
        
        @order.save
        redirect to "/servers/#{@current_server.id}"
      end
    
      get '/orders/:id' do 
        @order = Order.find(params[:id])
        erb :'/orders/show'
      end
    
      patch '/orders/:id' do 
    
        redirect to "orders/#{@order.id}"
      end

end