
BREAK_LINE = "\n"

def self.generate

end

namespace :order do
  task :generate_model do
    touch 'lib/e4commerce/Order.rb'

    file_path = 'lib/e4commerce/Order.rb'

    content = "class Order < ActiveRecord::Base" + BREAK_LINE + "end" +
               BREAK_LINE
    write_content(file_path, content)
  end
end
