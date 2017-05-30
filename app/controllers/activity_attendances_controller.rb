class ActivityAttendancesController < ApplicationController
  def show
    activity_id = params[:activity_id]
    cellphone = params[:cellphone]
    attendance = Attendance.find_by(activity_id: activity_id, cellphone: cellphone)
    render json: attendance
  end
end
