class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def edit
  end

  def show
  end

  def index
    @lista_labels = Label.all
  end

  def create

    @label = Label.new(params.require(:label).permit(:title, :active))

    if @label.save
      redirect_to labels_path
    else
      redirect to :controller => 'main', :action => 'error'
    end

  end

  def update
  end

  def destroy
  end
end
