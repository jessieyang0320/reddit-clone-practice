class LinksController < ApplicationController

  def index
  	@links = Link.all

  end 

  def new
  	@link = Link.new
  end 

  def create
  	Link.create(link_params)
  	redirect_to links_path
  end 

  def edit
  	@link = Link.find(params[:id])

  end 

  def update
  	@link = Link.find(params[:id])
  	@link.update_attributes(link_params)
  	redirect_to links_path
  end 

  def show
  	@link = Link.find(params[:id])
  end 

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path

  end 

  private
  def link_params
  	params.require(:link).permit(:title, :url)
  end 
end
