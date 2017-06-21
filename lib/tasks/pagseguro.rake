require 'fileutils'

task ('one') do 
	puts "one"
end

task({'two' => ['one']}) do
  puts 'two'
end


task ({'file ' => ['pagseguro']}) do 


end 

task :thing, [:foo] do |task, args|
  puts args[:foo]
end

file :pagseguro, [:token] => :environment do |file, args|

	new_line = "\n"
	content = ""
	tab = "   "

	content = content + "PagSeguro.configure do |config|" + new_line
	
	content = content + tab + "config.token = " + (args[:token]) + new_line
	content = content + tab + "config.email = " + (args[:token]) + new_line
	content = content + tab + "config.environment = #production" + new_line
	content = content + tab + "config.email = #UTF-8" + new_line
	
	content = content + "end" + new_line

 	aux  =  "lib/tasks/pagseguro.rb"

 	puts "CREATED " + aux + new_line

 	File.open(aux, "w+") { |file| file.write(content) }
end

file :pagsegurocontrollers => :environment do |file, args|

	new_line = "\n"
	content = ""
	tab = "   "

	FileUtils.mkdir_p("lib/pagseguro")
	FileUtils.cp("lib/e4commerce/ps_checkout_template.rb", "lib/pagseguro/checkout_controller.rb")
	FileUtils.cp("lib/e4commerce/notifications_controller.rb", "lib/pagseguro/notifications_controller.rb")

 	aux  =  "./checkout_controller.rb"

 	puts "CREATED FOLDER pagseguro"
 	puts "CREATED Notification and checkout controllers"

 	#File.open(aux, "w+") { |file| file.write(content) }
end
