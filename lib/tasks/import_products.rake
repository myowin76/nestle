task :import_product => :environment do

require 'nokogiri'

  # require 'open-uri'
  # doc = Nokogiri::XML(open(url))

  doc = Nokogiri::XML(File.open("#{Rails.root}/public/nestle.xml")) 
  products = doc.search('//Product')

    products.each do |product|

      @data = Product.new(
        :name           => event.at('name').text,
        :date           => '2011-09-18',
        :time           => '17:00',
        :description    => event.at('long_description').text,
        :address        => event.at('street').text,
        :postcode       => event.at('postcode').text,   
        :price          => event.at('costs').text,
        :town_id        => 1
      )

      @data.save

      if @data.save
          puts "Success"
      else
          puts "This didn't save, F***"
      end
    end
end