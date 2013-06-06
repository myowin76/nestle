class HomeController < ApplicationController
  def index
  	@gtins = Gtin.paginate(:page => params[:page], :per_page => 30)
  	
  end
end
