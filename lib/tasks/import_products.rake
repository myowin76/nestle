task :import_products => :environment do

require 'nokogiri'

  # require 'open-uri'
  # doc = Nokogiri::XML(open(url))

  doc = Nokogiri::XML(File.open("#{Rails.root}/public/nestle.xml")) 
  products = doc.search('//Product')

    products.each do |product|
      # id = product.at("Subscription")["Id"]
      # prod = Product.find_by_id(id)
      # if prod.nil?
        @data = Gtin.new(
        # :product_id     => product.at("Subscription")["Id"],
        :gtin           => product.at("Code[Scheme='GTIN']").text,
        # :code           => product.at("Subscription")["Code"],
        # :name           => product.at('name').text,
        # :date           => '2011-09-18',
        # :time           => '17:00',
        # :name           => product.at("Subscription").text,
        :description    => product.at('DiagnosticDescription').text
        # :address        => product.at('street').text,
        # :postcode       => product.at('postcode').text,   
        # :price          => product.at('costs').text,
        # :town_id        => 1
      )

        @data.save

        if @data.save
            puts "Success"
        else
            puts "This didn't save, F***"
        end
      # else



      # end

      
    end
end