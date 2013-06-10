class HomeController < ApplicationController
  def index
  	@gtins = Gtin.paginate(:page => params[:page], :per_page => 30)
    # debugger
  	doc = Nokogiri::XML(File.open("#{Rails.root}/public/nestle.xml")) 
  	@products = doc.xpath("//Product")
  	# @existing_products = Product.all
  	# debugger
  	# @products.each do |product|
	# 	gtin = product.at("Code").text
	# 	# subscription = product.at("Subscription").text
	# 	description = product.at("DiagnosticDescription").text
		# product_id = product.at("Subscription")["Id"]
		# product_code = product.at("Subscription")["Code"]


	# end

	# doc.close

  end
end
