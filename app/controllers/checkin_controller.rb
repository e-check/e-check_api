class CheckinController < ApplicationController
  def index
    form_id = params[:form_id]
    render json: Checkin.where(form_id: form_id)
  end

  def create
    checkin = Checkin.create(params.require(:checkin).permit(:name,:cellphone,:form_id))
    render json: checkin, status: :created
  end

  def check_signup
    jinshuju_entry = JinshujuEntry.exists?(cellphone: params[:cellphone], form_id: params[:form_id])
    jinshuju_entry ? (render status: :ok) : (render status: :not_found)
  end
end
