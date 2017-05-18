class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def create
    activity_params = params.require('activity').permit(:name, :form_id)
    Activity.create activity_params
  end
end
