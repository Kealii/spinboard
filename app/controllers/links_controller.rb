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

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
