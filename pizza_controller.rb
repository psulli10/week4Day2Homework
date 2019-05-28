require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# INDEX route - DISPLAY ALL PIZZAS

get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW - DISPLAY A FORM TO MAKE A NEW PIZZA ORDER

get '/pizza_orders/new' do
  erb(:new)
end

# CREATE _ CREATE A DATABASE ENTRY FOR THE NEW PIZZA

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# SHOW - DISPLAY ONE PIZZA

get '/pizza_orders/:id' do
  # puts params[:id]
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end



# EDIT - DISPLAY A FORM TO EDIT A PIZZ ORDER'S DETAILS

get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE - UPDATES A DATABASE ENTRY FOR THE EDITED PIZZA

post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect '/pizza_orders'
end

# DELETE - DELETES A PIZZA ORDER FROM THE DATABASE

post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.new(params)
  @order.delete()
  redirect '/pizza_orders'
  # erb(:delete)
end
