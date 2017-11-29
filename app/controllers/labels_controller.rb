class LabelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    if ( current_user.permit("Administrar") )
      @label = Label.new
    else
      redirect_to :controller => 'main', :action => 'sin_permiso'
    end
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
    @label.title = @label.title.upcase.gsub(/[^A-Z]/, '')
    if @label.save
      redirect_to labels_path
    else
      redirect_to new_label_path, :alert => @label.errors.messages[:title]
    end

  end

  def update
  end

  def destroy
  end
end
