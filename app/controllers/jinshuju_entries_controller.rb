class JinshujuEntriesController < ApplicationController
  def index
    render json: JinshujuEntry.all
  end

  def create
    entry = generate_entry
    JinshujuEntry.create(entry)
    render status: :ok
  end

  def destroy
    id = params[:id]
    JinshujuEntry.destroy(id)
  end

  private
  def generate_entry
    {
        cellphone: get_cellphone(params[:entry]),
        form_id: params[:form],
        raw_data: request.raw_post
    }
  end

  def get_cellphone(entry)
    entry.each do |field|
      if /^1[34578]\d{9}$/.match? entry[field].to_s
        return entry[field]
      end
    end
  end
end
