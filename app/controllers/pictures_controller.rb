class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @picture = Picture.new(params[:picture])
  end
end
