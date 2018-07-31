class GenresController < ApplicationController
  def index
    @genres = Genre.all
    if current_admin?
      @genre = Genre.new
    end
  end
end