require "csv"
require "rubygems"
require "zip"

class Admin::FilmsController < ApplicationController
  include ActionController::MimeResponds
  before_action :get_films
  before_action :get_export, only: %i[index]
  def index
    respond_to do |format|
      format.html do
        send_data @export.link.download, filename: "export-#{params[:export_id]}.csv"
      end
      format.csv do
        response.headers["Content-Type"] = "text/csv"
        response.headers["Content-Disposition"] = "attachment; filename=films-#{Date.today}.csv"
        FilmsBulkExportJob.perform_later
        render template: "admin/films/index.csv.erb"
      end
    end
  end

  def show
  end

  def create
    export = Export.create(name: Time.now)
    FilmsBulkExportJob.perform_later(export.id)
    render json: "File is creating", status: 204
  end

  private

  def get_films
    @films = Film.all.order(name: :desc)
  end

  def get_export
    @export = Export.find_by(id: params[:export_id])
  end
end
