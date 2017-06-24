
BREAK_LINE = "\n"


namespace :cart do
  task :generate_model do
    touch 'lib/e4commerce/cart.rb'

    file_path = 'lib/e4commerce/cart.rb'

    content = "class Cart < ActiveRecord::Base" + BREAK_LINE

    content += "  has_many :products" + BREAK_LINE + "end" + BREAK_LINE

    write_content(file_path, content)
  end
end

task :CartInitialize do

	ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'database.db'

	ActiveRecord::Schema.define do
	  unless ActiveRecord::Base.connection.tables.include? 'tags'
	    create_table :cart do |table|
	      table.column :total_price, :float
        table.column :number_items, :integer
	    end
	  end
	end
end
