class PhotosController < ApplicationController

  def index
    @photo=Photo.all
  end

  def new
    @photo=Photo.new
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo=Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to root_path
    else
      render :new, :status, :unprocessable_entity
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.each do |pho|
      @url=pho.img 
      @name=pho.name
      @trash=Trash.new(img: @url, name: @name)
    end

    @photo.destroy
    if @photo.destroy(photo_params)
      debugger
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
    def photo_params
      params.require(:photo).permit(:name, :img)
    end


end