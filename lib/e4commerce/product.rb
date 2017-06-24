module E4commerce

	require "abstraction"
	require "active_record"

	# class E4CProduct < ActiveRecord::Base -> Rails project, need database
	class E4CProduct < ActiveRecord::Base
		abstract

		attr_accessor :title
		attr_accessor :serial_number
		attr_accessor :brand
		attr_accessor :unit_price

		def initialize(title, serial_number, brand, unit_price)
			@title = title
			@serial_number = serial_number
			@brand = brand
			@unit_price = unit_price
		end

    def search
      raise 'Abstract method'
    end

    def sale
      raise 'Abstract method'
    end

	end

end
