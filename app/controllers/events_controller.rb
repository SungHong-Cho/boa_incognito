class EventsController < ApplicationController
  before_filter :authenticate_admin!, except: [:image_upload]
  def main
    @events = Event.all.asc(:priority)
  end

  def index
    @entries = Event.all.asc(:priority)
    render "shared/index"
  end

  def new
    @editor = Event.new
    @url = events_path
    @method = "POST"
    render "shared/new"
  end

  def create
    @event = Event.new(params['event'])
    @event.thumb_image = params['event']['thumb_image']
    @event.save!
    redirect_to events_path
  end

  def show
    @editor = Event.find(params[:id])
    render "shared/show"
  end

  def edit
    @editor = Event.find(params[:id])
    @url = event_path(@editor)
    @method = "PUT"
    render "shared/edit"
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(priority: params[:event][:priority], title: params[:event][:title], content: params[:event][:content], visible: params[:event][:visible])
    if(params[:event][:thumb_image]) then
      @event.thumb_image = params[:event][:thumb_image]
    end
    @event.save
    redirect_to event_path(@event)
  end

  def destroy
    Event.find(params[:id]).destroy
   redirect_to events_path
  end

  def image_popup
    render "shared/image_popup", layout: false
  end

  def image_upload
    Image.mount_uploader(:event, ImageUploader)
    image = Image.new
    image.event = (params[:image])
    image.save!

    @imageurl = @originalurl = @thumburl = image.event.url
    @filename = image.event.filename
    @filesize = image.event.size
    @imagealign = "c"

    render layout: false
  end

  # remake path.
  def edit_path(entry)
    edit_event_path(entry)
  end

  def path(entry)
    event_path(entry)
  end

  def index_path
    events_path
  end

  def new_path
    new_event_path
  end

  def main_path
    event_main_path
  end

  def image_popup_path
    events_image_popup_path
  end


  def image_upload_path
    events_image_upload_path
  end
end
