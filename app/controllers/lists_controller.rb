class ListsController < ApplicationController
  before_action :set_lists, only: %i[index show]

  def index
  end

  def show
    @list = @lists.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy
    redirect_to lists_path
  end

  private

  def set_lists
    @lists = List.all
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
