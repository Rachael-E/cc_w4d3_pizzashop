require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')

# index
get '/pizza_orders' do
  @orders = PizzaOrder.all() # this gives us back an array of pizza objects and assigns it to @orders instance variable that we can pass through our index.erb file
  erb(:index)
end

# new
get '/pizza_orders/new' do # when placed below the # show, it thinks that new is the key that's being fed to :id. So move it above.
  erb(:new)
end

# show
get '/pizza_orders/:id' do #:id is the parameter that will be entered in the url
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show) # create show.erb
end

# create
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end



# edit
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)

end

# update
post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to "/pizza_orders"
end

# delete
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect to "/pizza_orders"
end
