class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter do 
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  protected
    def restrict_access
      unless @current_user
        flash[:alert] = "You must logIn"
        redirect_to new_session_path
      end
    end
end
