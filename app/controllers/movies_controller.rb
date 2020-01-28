class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update, :destroy]
    def index
        @movies = Movie.all.order("created_at DESC")
    end

    def new
        @movie = current_user.movies.build
        @categories = Category.all.order(:name).map{|x| [x.name, x.id]}
    end

    def create
        @movie = current_user.movies.build(movie_params)
        @movie.category_id = params[:category_id]

        if @movie.save
            redirect_to root_path
        else
            render new
        end
    end

    def show 
    end

    def edit  
    end

    def update  
        @movie.category_id = params[:category_id]
          if @movie.update(movie_params)
              redirect_to movie_path
          else
            render edit
          end
    end

    def destroy
        @movie.destroy 
        redirect_to root_path 
    end


    private 
    def movie_params
        params.require(:movie).permit(:title, :description, :director, :category_id)
    end

    def find_movie
        @movie = Movie.find(params[:id])
    end
end
