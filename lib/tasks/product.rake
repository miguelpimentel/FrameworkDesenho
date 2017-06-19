module Product

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