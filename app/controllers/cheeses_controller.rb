class CheesesController < ApplicationController
    def index
        cheeses = Cheese.all
        render json: cheeses, only: [:created_at, :updated_at]
    end

    def show
        #byebug
        cheese = Cheese.find(params[:id])
        if cheese
            render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
        else
            render json: {error: 'Cheese not found'}, status: :not_found
        end
    end

end
