class OrderController < ApplicationController
      get '/orders' do
        if is_logged_in?
        @orders = Order.where(:server_id => current_server[:id])

        
        erb :'/orders/index' 
        else
          redirect to '/home'
        end
      end
    
      get '/orders/new' do 
        if is_logged_in?
        erb :'/orders/new'
        else
          redirect to '/home'
        end
      end
    
      post '/orders' do 
        if params[:drink] == "" || params[:tbl_num] == "" || params[:quantity] == ""
          redirect to '/orders/new'
        else
        @order = current_server.orders.build(params)
        @order.save
        redirect to "/servers/#{current_server.id}"
      end
    end
      get '/orders/:id' do  
        @order = Order.find_by_id(params[:id])
        if current_server[:id] == @order[:server_id]
        erb :'/orders/show'
        else
          redirect to "/servers/#{current_server.id}"
        end
      end
      get '/orders/:id/edit' do
        if is_logged_in?
          @order = Order.find_by_id(params[:id])
          if @order && @order.server_id == current_server[:id]
            erb :'orders/edit'
          else
            redirect to '/orders'
          end
        else
          redirect to '/log_in'
        end
      end
      patch '/orders/:id' do 
        if is_logged_in?
        
          if params[:drink] == "" || params[:tbl_num] == "" || params[:quantity] == ""
            redirect to "/orders/#{params[:id]}/edit"
          else
            @order = Order.find_by_id(params[:id])
            if @order && @order.server_id == current_server[:id]
              if @order.update(drink: params[:drink], tbl_num: params[:tbl_num], quantity: params[:quantity])
                redirect to "/servers/:id"
              else
                redirect to "/orders/#{@order.id}/edit"
              end
            else
              redirect to '/orders'
            end
          end
        else
          redirect to '/log_in'
        end
      end
      delete '/orders/:id/delete' do
        if is_logged_in?
          @order = Order.find_by_id(params[:id])
          if @order && @order.server_id == current_server[:id]
            @order.delete
          end
          redirect to '/servers/:id'
        else
          redirect to '/log_in'
        end
      end
  end