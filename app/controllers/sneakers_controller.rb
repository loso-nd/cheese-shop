class SneakersController < ApplicationController
    #it also gives a clearer separation between the "happy path" of our code (no exceptions/errors) and the logic for handling exceptions/errors.
    # if any of our controller actions throw an ActiveRecord::RecordNotFound exception, our render_not_found_response method will return the appropriate JSON response.

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    #GET /sneakers
    def index
        sneakers = Sneaker.all
        render json: sneakers, except: [:created_at, :updated_at]
    end

    #GET /sneakers/:id
    def show
        sneaker = find_sneaker
        render json: sneaker, except: [:created_at, :updated_at]
    end

     
    #POST /sneakers
    def create
        #byebug
        # create! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
        sneaker = Sneaker.create(sneaker_params)
        render json: sneaker, status: :created
    end

    #find the bird that matches the ID from the route params
    #update the bird using the params from the body of the request
    
    #PATCH  /sneakers/:id
    def update 
        sneaker = find_sneaker
         # update! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
        sneaker.update(sneaker_params)
        render json: sneaker
    end

    #custom route calculating the number of likes and incrementing it, so that all the FE has to do is send a request ot oour new custom route, w/o worrying about sending any data in the body of the request.
    #PATCH  /sneakers/:id/like
    def increment_likes
        sneaker = find_sneaker
        sneaker.update(likes: sneaker.likes + 1)
        render json: sneaker
    end

    def destroy
        sneaker = find_sneaker
        sneaker.destroy
        head :no_content   
    end

    private

    def sneaker_params
        params.require(:sneaker).permit(:name, :brand, :description, :price, :my_type, :likes)
    end

    def find_sneaker
        Sneaker.find(params[:id])
    end

    def render_not_found_response
        render json: {errors: "Shoe not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end
end
