class AttendancesController < ApplicationController
  def index
    activity_id = params[:activity_id]
    render json: Attendance.where(activity_id: activity_id)
  end

  def create
    attendance_params = params.require(:attendance).permit(:name, :cellphone, :activity_id)

    if Attendance.exists?(activity_id: attendance_params[:activity_id], cellphone: attendance_params[:cellphone])
      render_bad_request '10101'
    else
      attendance = Attendance.create attendance_params
      render json: attendance, status: :created
    end
  end
end
