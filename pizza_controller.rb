require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza_order.rb")

# READ orders
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  # we are using @orders as the variable needs to be accessable outside the instance
  erb(:index)
  # when we hit the route pizza_orders it will take us to the index page which is located in the views folder.
  # localhost:4567/pizza_orders
end

# CREATE orders
get '/pizza_orders/new' do
  erb(:new)
end

post '/pizza_orders' do

  @order = PizzaOrder.new(params)
  @order.save()
  erb (:create)
end

# show order
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end
# this allows us to navigate to localhost:4567/pizza_orders/1
# to call the find function in pizza.rb file


# UPDATE existing orders


# DELETE orders
post '/pizza_orders/:id/delete' do

  PizzaOrder.find(params[:id]).delete()
  redirect to('/pizza_orders')
end

get '/pizza_orders/:id/edit' do
  PizzaOrder.find(params[:id])
  erb[:edit]
end
