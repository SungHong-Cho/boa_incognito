class ClipsController < ApplicationController
  before_filter :authenticate_admin!, except: [:image_upload]

  def main
    @clips = Clip.all.asc(:priority)
  end

  def index
    @entries = Clip.all.asc(:priority)
    render "shared/index"
  end

  def new
    @clip = Clip.new
  end

  def create
    Clip.create(params['clip'])
    redirect_to clips_path
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def edit
    @clip = Clip.find(params[:id])
  end

  def update
    @clip = Clip.find(params[:id])
    @clip.update_attributes(priority: params[:clip][:priority], title: params[:clip][:title], youtube_url: params[:clip][:youtube_url], visible: params[:clip][:visible])
    @clip.save
    redirect_to clip_path(@clip)
  end

  def destroy
    Clip.find(params[:id]).destroy
    redirect_to clips_path
  end

    # remake path.
  def edit_path(entry)
    edit_clip_path(entry)
  end

  def path(entry)
    clip_path(entry)
  end

  def index_path
    clips_path
  end

  def new_path
    new_clip_path
  end

  def main_path
    clip_main_path
  end

end
