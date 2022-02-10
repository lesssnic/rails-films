require "csv"
require "rubygems"
require "zip"

class Admin::DownloadsController < ApplicationController
  include ActionController::MimeResponds
  before_action :get_films
  def index
    @filename = "films-#{Date.today}.csv"
    @file = File.write(@filename, @films.to_csv)

    respond_to do |format|
      format.html { @films }
      format.csv { send_file @filename }
    end
  end

  def show
  end

  private

  def get_films
    @films = Film.all.order(name: :desc)
  end

  def create_blob
    file = File.open(@file)
    ActiveStorage::Blob.create_and_upload! io: file,
      filename: file.origin
    file.close
    result.key
  end
end
