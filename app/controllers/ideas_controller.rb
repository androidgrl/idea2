class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy]

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
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea.user
    end
  end

  def destroy
    @idea.destroy
    redirect_to @idea.user
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :user_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
