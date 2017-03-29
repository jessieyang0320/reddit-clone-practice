
class LinksController < ApplicationController
 
  before_action :authenticate_user!, except: [:index, :show] 

  def index
  	@links = Link.all

  end 

  def new
  	@link = current_user.links.build
  end 

  def create
  	@link=current_user.links.build(link_params)
    respond_to do |format|
    if @link.save
      format.html {redirect_to @link, notice: 'Link was successfully created'}
      format.json {render :show, status: :created, location: @link}
    else 
      format.html {render :new}
      format.json {render json: @link.errors, status: :unprocessable_entity}
    end 
  	
    end 
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

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end 

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_from current_user
    redirect_to :back

  end 

  private
  def link_params
  	params.require(:link).permit(:title, :url)
  end 
end
