class AboutsController < ApplicationController
  before_filter :authenticate_admin!, except: [:image_upload]

  def authenticate_admin!
    puts "authenticate : " + params.to_s+ "session : " + session.to_s
    super
  end
  def main
    @abouts = About.all.asc(:priority)
  end

  def index
    puts "index : " + params.to_s+ "session : " + session.to_s
    @entries = About.all.asc(:priority)
    render "shared/index"
  end

  def new

    @editor = About.new
    @url = abouts_path
    @method = "POST"
    render "shared/new"
  end

  def create
    About.create(params['about'])
    redirect_to abouts_path
  end

  def show
    puts "show: " + params.to_s + "session : " + session.to_s
    @editor = About.find(params[:id])
    render "shared/show"
  end

  def edit
    puts "edit: " + params.to_s + "session : " + session.to_s
    @editor = About.find(params[:id])
    @url = about_path(@editor)
    @method = "PUT"
    render "shared/edit"
  end

  def update
    puts "update: " + params.to_s + "session : " + session.to_s
    @about = About.find(params[:about][:id])
    @about.update_attributes(priority: params[:about][:priority], title: params[:about][:title], content: params[:about][:content], visible: params[:about][:visible])
    @about.save
    redirect_to index_path
  end

  def destroy
    About.find(params[:id]).destroy
   redirect_to abouts_path
  end

  def image_popup
    render "shared/image_popup", layout: false
  end

  def image_upload
    Image.mount_uploader(:about, ImageUploader)
    image = Image.new
    image.about = (params[:image])
    image.save!

    @imageurl = @originalurl = @thumburl = image.about.url
    @filename = image.about.filename
    @filesize = image.about.size
    @imagealign = "c"

    render layout: false
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
