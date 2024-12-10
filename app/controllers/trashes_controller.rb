class TrashesController < ApplicationController
  def index
    @trash=Trash.all
  end

  def new
    @trash=Trash.new
  end

  def show
    @trash=Trash.find(trash_params)
  end

  def edit
    @trash=Trash.find(params[:id])
  end

  def create
    @trash = Trash.new(trash_params)

    if @trash.save
      redirect_to @trash
    else
      render :new, :status, :unprocessable_entity
  end

  def update
    @trash = Trash.find(params[:id])

    if @trash.update(trash_params)
      redirect_to @trash
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trash = trash.find(params[:id])
    @trash.each do |tra|
      @url=tra.img 
      @name=tra.name
      @trash=trash.new(img: @url, name: @name)
    end

    @trash.destroy!
  end

  private
  def trash_params
    params.expect(trash: [:img, :name])
  end
end
