class RetailersController < ApplicationController
  def index
    @retailers = Retailer.all
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  def new
    @retailer = Retailer.new
  end

  def create
    @retailer = Retailer.new(params[:retailer])
    if @retailer.save
      redirect_to @retailer, :notice => "Successfully created retailer."
    else
      render :action => 'new'
    end
  end

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    if @retailer.update_attributes(params[:retailer])
      redirect_to @retailer, :notice  => "Successfully updated retailer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @retailer = Retailer.find(params[:id])
    @retailer.destroy
    redirect_to retailers_url, :notice => "Successfully destroyed retailer."
  end
end
