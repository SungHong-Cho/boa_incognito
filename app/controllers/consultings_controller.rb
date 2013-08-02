class ConsultingsController < ApplicationController
  before_filter :authenticate_admin!, except: [:create]

  def main
    @consultings = Consulting.all
  end

  def index
    @consultings = Consulting.all
  end

  def new
  end

  def create
    @consulting = Consulting.new(params[:consulting])
    @consulting.save!
    puts params
    redirect_to root_path
  end

  def show
    @consulting = Consulting.find(params[:id])
  end

  def edit
    about = About.first
    @title = about.title
    @content = about.content
  end

  def update
  end

  def destroy
    @consulting = Consulting.find(params[:id])
    @consulting.destroy
    redirect_to consultings_path
  end
end
