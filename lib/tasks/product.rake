module Product

	require "active_record"

  def self.generate

  end

end

task :environment do
  puts "Setting up environment"
end

namespace :product do
    new_line = "\n"
    content = ""
    tab = "   "

    desc "Generate a model that heritances from product"
    #usage example: rake product:generate_model[Nike,numero,cor,tipo]
    task :generate_model do |task, args|

        file  =  "lib/e4commerce/#{args.extras[0]}.rb"

        #Check if first letter of first argument is uppercased
        upregex = Regexp.new("/[[:upper:]]/")
        if args.extras[0][0].upcase! then
            abort("First letter of a class must be in uppercase")
        end

        content = "class #{args.extras[0]} < E4CProduct" + new_line

        #Include validations to each element but first
        args.extras.drop(1).each do |params|
            content += tab + "validates :#{params}, presence: true" + new_line
        end

        content += "end"

        #Writes the model
        File.open(file, "w+") { |file| file.write(content) }

    end
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
