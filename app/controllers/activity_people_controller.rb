class ActivityPeopleController < ApplicationController
  def show
    activity_id = params[:activity_id]
    cellphone = params[:cellphone]
    activity = Activity.find(activity_id)
    entry = JinshujuEntry.find_by(form_id: activity.form_id, cellphone: cellphone)

    if entry
      render json: entry, status: :ok
    else
      render status: :not_found
    end
  end
end