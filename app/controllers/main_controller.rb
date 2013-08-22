class MainController < ApplicationController
  layout "main"

  def index
    @event = Event.where(visible: true).asc(:created_at).first
  end

  def about
    @abouts = About.all.asc(:priority)
  end

  def clip
    @clips = Clip.all.asc(:priority)
  end

  def event
    @events = Event.all.asc(:priority)
  end

  def consulting
    @consulting = Consulting.new
  end

  def progress 
  end

  def feature
  end

  def kakao
  end

end
