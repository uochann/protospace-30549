class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :destory, :creste]
  before_action :move_to_edit, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id), method: :get
    else
      render :edit
    end
  end

  def create
    prototype = Prototype.create(prototype_params)
    if prototype.update(prototype_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end