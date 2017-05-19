class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def create
    activity_params = params.require('activity').permit(:name, :form_id)
    activity = Activity.create activity_params
    render json: activity, status: :created
  end

  def destroy
    id = params[:id]
    Activity.destroy(id)
  end
end
