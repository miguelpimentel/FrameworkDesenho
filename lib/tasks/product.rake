require 'e4commerce/product.rb'

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
end