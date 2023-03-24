class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers.map { |camper| { id: camper.id, name: camper.name, age: camper.age } }, status: :ok
      end
    
      def show
        camper = Camper.find_by(id: params[:id])
        if camper
          render json: {
            id: camper.id,
            name: camper.name,
            age: camper.age,
            activities: camper.activities.map { |activity| { id: activity.id, name: activity.name, difficulty: activity.difficulty } }
          }, status: :ok
        else
          render json: { error: "Camper not found" }, status: :not_found
        end
      end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else 
            render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
