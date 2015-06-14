class IdeasController < ApplicationController
  def new
    @idea = Idea.new(user_id: params[:user_id])
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      redirect_to idea.user
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea.user
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :user_id)
  end
end
