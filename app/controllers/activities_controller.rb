class ActivitiesController < ApplicationController
  before_action :authenticate_user_from_jwt

  def index
    render json: Activity.all
  end

  def show
    activity = Activity.find(params[:id])
    if activity
      render json: activity
    else
      render status: :not_found
    end
  end

  def create
    activity_params = {user_id: @current_user_id,
                       name: params[:name],
                       form_id: params[:form_id]}
    activity = Activity.create activity_params
    render json: activity, status: :created
  end

  def destroy
    id = params[:id]
    Activity.destroy(id)
  end


end
