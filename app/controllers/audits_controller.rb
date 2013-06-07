class AuditsController < ApplicationController
  def index

    @audits = Audit.all
  end

  def audit_product

    @gtin = params[:gtin]
    # @audits = Audit.order(:id)  

    #page load - without retailer id
    @audits = Audit.where(:gtin => @gtin)

    if @audits.nil?
      @audit = Audit.new
      @audit.update_attributes(:gtin => @gtin)
    end

    

    # 
    if params[:retailer_id].present?
      retailer_id = params[:retailer_id]
      if @audits.where(:retailer_id => retailer_id).present?
        # Product existed for the Retailer(Tesco e.g) - to be show data or update
        @audit = @audits.where(:retailer_id => retailer_id, :gtin => @gtin)


      else
        # New Product for the Retailer(Tesco e.g) - add to Audit and build properties
        @audit = Audit.new
        @audit.update_attributes(:gtin => @gtin, :retailer_id => retailer_id)

      end
    end




    debugger

    
    @gtin = params[:gtin]

    @retailers = Retailer.order(:name)

    @doc = Nokogiri::XML(File.open("#{Rails.root}/public/nestle.xml")) 

    @products = @doc.xpath("//Product")
    # debugger
    # @products.each do |product|
    #   # if(@products.at_css("Code[Scheme='GTIN']").content == @gtin)
    #   if(product.at_css("ProductCodes Code[Scheme='GTIN']").text == @gtin)
    #     @product = product
    #   end
    # end
    # debugger


    respond_to do |format|
      format.js {
        render :partial => 'audit_product'
      }
    end
    
  end


  def update_audit
    debugger


  end



  def show
    @audit = Audit.find(params[:id])
  end

  def new
    @audit = Audit.new
  end

  def create
    @audit = Audit.new(params[:audit])
    if @audit.save
      redirect_to @audit, :notice => "Successfully created audit."
    else
      render :action => 'new'
    end
  end

  def edit
    @audit = Audit.find(params[:id])
  end

  def update
    
    @audit = Audit.find(params[:id])
    if @audit.update_attributes(params[:audit])
      redirect_to @audit, :notice  => "Successfully updated audit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @audit = Audit.find(params[:id])
    @audit.destroy
    redirect_to audits_url, :notice => "Successfully destroyed audit."
  end
end
