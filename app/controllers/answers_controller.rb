class AnswersController < ApplicationController
  def new
  end

  def edit
  end

  def show
        @answer = Answer.find(params[:id])
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end
end
