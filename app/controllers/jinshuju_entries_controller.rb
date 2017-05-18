class JinshujuEntriesController < ApplicationController
  def create
    entry = generate_entry
    JinshujuEntry.create(entry)
    render status: :no_content
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
      if /^1[34578]\d{9}$/.match? entry[field]
        return entry[field]
      end
    end
  end
end
