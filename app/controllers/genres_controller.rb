class GenresController < ApplicationController
  def index
    @genres = Genre.all
    if current_admin?
      @genre = Genre.new
    end
  end

  def show
    @genre = Genre.includes(:songs).find(params[:id])
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end