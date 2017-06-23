module Product

	require "active_record"

  def self.generate

  end

end

task :environment do
  puts "Setting up environment"
end

namespace :product do
  desc "All taks related to products"
  task :generate_product, [:name, :price, :image_url] => [:environment] do |t, args|
    puts "Here goes the code that generates products, yet create model Product"
    puts "product: ", args
  end
end



task :E4Cinitialize do

	ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'database.db'

	ActiveRecord::Schema.define do
	  unless ActiveRecord::Base.connection.tables.include? 'tags'
	    create_table :product do |table|
	      table.column :title , :string
	      table.column :serial_number, :string
	      table.column :unit_price, :float
	      table.column :unit_price, :float
	    end
	  end
	end
  
end
