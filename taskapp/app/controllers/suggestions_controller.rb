class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to @suggestion
    else
      render :new
    end

  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.update(suggestion_params)
      redirect_to @suggestion
    else
      render :edit
    end

  end


  private

  def suggestion_params
    params.require(:suggestion).permit(:task_id, :description, :date, :duration, :user_id)
  end
end
