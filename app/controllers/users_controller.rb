class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
  end

  def edit
  end

  def show
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
