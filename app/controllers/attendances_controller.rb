class AttendancesController < ApplicationController
  def index
    activity_id = params[:activity_id]
    render json: Attendance.where(activity_id: activity_id)
  end

  def create
    attendance_params = params.require(:checkin).permit(:name, :cellphone, :activity_id)
    attendance = Attendance.create attendance_params
    render json: attendance, status: :created
  end
end
