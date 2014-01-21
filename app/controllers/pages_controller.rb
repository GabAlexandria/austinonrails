class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show
  end

  def home
    @photos = Photo.featured
    @videos = Video.featured
  end

  private

  def set_page
    @page = Page.find_by_slug(params[:id])
  end

end
