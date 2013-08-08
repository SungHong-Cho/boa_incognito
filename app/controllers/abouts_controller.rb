class AboutsController < ApplicationController
  before_filter :authenticate_admin!, except: [:image_upload]

  def main
    @abouts = About.all.asc(:priority)
  end

  def index
    @entries = About.all.asc(:priority)
    render "shared/index"
  end

  def new
    @about = About.new
  end

  def create
    About.create(params['about'])
    redirect_to abouts_path
  end

  def show
    @about = About.find(params[:id])
  end

  def edit
    @about = About.find(params[:id])
  end

  def update
    @about = About.find(params[:about][:id])
    @about.update_attributes(priority: params[:about][:priority], title: params[:about][:title], visible: params[:about][:visible])
    @about.save
    redirect_to index_path
  end

  def destroy
    About.find(params[:id]).destroy
   redirect_to abouts_path
  end

  # remake path.
  def edit_path(entry)
    edit_about_path(entry)
  end

  def path(entry)
    about_path(entry)
  end

  def index_path
    abouts_path
  end

  def new_path
    new_about_path
  end

  def main_path
    about_main_path
  end

  def image_popup_path
    abouts_image_popup_path
  end

  def image_upload_path
    abouts_image_upload_path
  end
end
