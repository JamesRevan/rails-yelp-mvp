class RestaurantsController < ApplicationController

def index
  @restaurants = Restaurant.all
end

def show
  @restaurant = Restaurant.find(params[:id])
end

def new
  @restaurant = Restaurant.new
end

 def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end





# def create
#   @restaurant = Restaurant.new(params[:restaurant)
#   if @restaurant.save
#     flash[:notice] = "restaurant has been added"
#     redirect_to_root_path
#   else
#     flash[:error] = "restaurant has not been added"
#     render :new
#   end
# end

def update
  @restaurant = Restaurant.find(params[:id])
  if @restaurant.update_attributes(restaurant_params)
    flash[:notice] = "restaurant updated! HURRAY!!"
    redirect_to_root_path
  else
    flash[:error] = "You are a failure"
  end
end

def destroy
  @restaurant = Restaurant.find(params[:id])
  if @restaurant.delete(restaurant_params)
    flash[:notice] = "You deleted this foul restaurant"
    redirect_to_root_path
  else
    flash[:error] = "You did not delete this restaurant you cretin"
  end
end

def edit
  @restaurant = Restaurant.find(params[:id])
end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end











# def index
#   @Restaurants
# end

# def create
#     @restaurant = Restaurant.new(restaurant_params)
#     @restaurant.save
#   end

#   def update
#     @restaurant = Restaurant.find(params[:id])
#     @restaurant.update(restaurant_params)
#   end


