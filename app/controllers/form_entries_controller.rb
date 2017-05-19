class FormEntriesController < ApplicationController
  def show
    args = Array.new(cellphone: params[:cellphone], form_id: params[:form_id])
    jinshuju_entry = JinshujuEntry.find_by(args)

    if jinshuju_entry
      render json: jinshuju_entry, status: :ok
    else
      render status: :not_found
    end
  end
end