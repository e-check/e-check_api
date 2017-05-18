class CheckinController < ApplicationController
  def index
    test = {a: 1}
    render json: test
  end

  def create
    checkin = Checkin.create(params.require(:checkin).permit(:name,:cellphone,:form_id))
    render json: checkin, status: :created
  end

  def check_signup
    jinshuju_entry = JinshujuEntry.exists?(params[:cellphone])

  end
end
