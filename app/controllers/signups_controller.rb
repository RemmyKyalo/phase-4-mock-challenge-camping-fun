class SignupsController < ApplicationController
    def create
      signup = Signup.create(signup_params)
      if signup.save
        activity = signup.activity.as_json(only: [:id, :name, :difficulty])
        render json: activity, status: :created
      else
        render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def signup_params
      params.permit(:time, :camper_id, :activity_id)
    end
  end
  