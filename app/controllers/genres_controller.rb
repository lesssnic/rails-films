class GenresController < SecureController
  before_action :find_by_id, only: [:update, :destroy]
  def index
    @genre = Genre.all
    render json: {data: @genre, type: "Genres"}
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: @genre
    else
      render json: params
    end
  end

  def update
    if @genre.update(genre_params)
      render json: "Updated"
    else
      render json: "Something went wrong"
    end
  end

  def destroy
    if @genre.destroy
      render json: "Destroyed"
    else
      render json: "Something went wrong"
    end
  end

  def find_by_id
    @genre = Genre.find_by id: params[:id]
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
