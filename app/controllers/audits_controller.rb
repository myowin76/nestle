class AuditsController < ApplicationController
  def index

    @audits = Audit.all
  end

  def audit_product

    @retailers = Retailer.order(:name)
    @gtin = Gtin.find_by_gtin(params[:gtin])
    
    if params[:retailer_id].present?
      
      unless @gtin.retailers.where(:id => params[:retailer_id]).present?
        # @gtin.audits.find_by_retailer_id  
        audit = @gtin.audits.new(:gtin_id => @gtin.id, :retailer_id => params[:retailer_id])
        audit.save
      else
        @audit = @gtin.audits.where(:retailer_id => params[:retailer_id])
      end  

    end  
    # @audits = Audit.order(:id)
    # debugger
    #page load - without retailer id
    # @audits = Audit.where(:gtin => gtin)

    # unless @audits.present?
    #   # @audit = Audit.new
    #   # @audit.update_attributes(:gtin => gtin)
    # end

    # if params[:retailer_id].present?
    
    #   retailer_id = params[:retailer_id]
    #   if @audits.where(:retailer_id => retailer_id).present?
    #     # Product existed for the Retailer(Tesco e.g) - to be show data or update
    #     @audit = @audits.where(:retailer_id => retailer_id, :gtin => @gtin)
        

    #   else
    #     # New Product for the Retailer(Tesco e.g) - add to Audit and build properties
    #     @audit = Audit.new
    #     @audit.update_attributes(:gtin => @gtin, :retailer_id => retailer_id)

    #   end
    # end


    

    # Read XML file
    @doc = Nokogiri::XML(File.open("#{Rails.root}/public/nestle.xml")) 
    @products = @doc.xpath("//Product").first
    debugger
    # TO DO... FIND THE PRODUCT NODE AND FETCH THE DATA...
    # TO DO...

    respond_to do |format|
      format.html
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
