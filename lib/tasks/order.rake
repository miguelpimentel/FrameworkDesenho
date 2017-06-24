
BREAK_LINE = "\n"

def self.generate

end

namespace :order do
  task :generate_model do
    touch 'lib/e4commerce/Order.rb'

    file_path = 'lib/e4commerce/Order.rb'


    content = "class Order < ActiveRecord::Base" + BREAK_LINE

    content += "  has_many :products" + BREAK_LINE + "end" + BREAK_LINE

    write_content(file_path, content)
  end
end

task :OrderInitialize do

	ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'database.db'

	ActiveRecord::Schema.define do
	  unless ActiveRecord::Base.connection.tables.include? 'tags'
	    create_table :order do |table|
	      table.column :total_price, :float
        table.column :number_items, :integer
	    end
	  end
	end
end
