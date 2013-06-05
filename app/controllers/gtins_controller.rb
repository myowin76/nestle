class GtinsController < ApplicationController
  def index
    @gtins = Gtin.all
  end

  def show
    @gtin = Gtin.find(params[:id])
  end

  def new
    @gtin = Gtin.new
  end

  def create
    @gtin = Gtin.new(params[:gtin])
    if @gtin.save
      redirect_to @gtin, :notice => "Successfully created gtin."
    else
      render :action => 'new'
    end
  end

  def edit
    @gtin = Gtin.find(params[:id])
  end

  def update
    @gtin = Gtin.find(params[:id])
    if @gtin.update_attributes(params[:gtin])
      redirect_to @gtin, :notice  => "Successfully updated gtin."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gtin = Gtin.find(params[:id])
    @gtin.destroy
    redirect_to gtins_url, :notice => "Successfully destroyed gtin."
  end
end
