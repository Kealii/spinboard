class LinksController < ApplicationController
  before_filter :authorize

  def index
  end

  def create
    link = current_user.links.build(link_params)
    if link.save
      flash[:notice] = 'Link Saved'
      redirect_to links_path
    else
      flash[:notice] = 'Did not Save'
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    link.update_attributes(link_params)
    redirect_to links_path
  end

  def change_status
    link = Link.find(params[:id])
    link.read ? link.read = false : link.read = true
    link.save
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
