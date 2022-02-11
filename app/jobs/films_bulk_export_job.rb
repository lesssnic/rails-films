require "csv"

class FilmsBulkExportJob < ApplicationJob
  queue_as :default

  def perform(id)
    films = Film.all.order(name: :desc)
    filename = "#{Rails.root}/tmp/temp.csv"
    @headers = %w[id name description limit]
    CSV.open(filename, "w", write_headers: true, headers: @headers) do |csv|
      films.each do |film|
        csv << (@headers.map { |header| film.send(header) })
      end
    end
    export = Export.find_by(id: id)
    export.link.attach(io: File.open(filename),
      filename: "temp.csv",
      content_type: "text/csv")
    File.delete(filename) if File.exist?(filename)
  end
end
