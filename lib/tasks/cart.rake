
BREAK_LINE = "\n"

def self.generate

end

namespace :cart do
  task :generate_model do
    touch 'lib/e4commerce/cart.rb'

    file_path = 'lib/e4commerce/cart.rb'

    content = "class Cart < ActiveRecord::Base" + BREAK_LINE + "end" +
               BREAK_LINE
    write_content(file_path, content)
  end
end
