task ('one') do 
	puts "one"
end

task({'two' => ['one']}) do
  puts 'two'
end


task ({'file ' => ['pagseguro']}) do 


end 

# file :pagseguro, [:s] do |file, args|

# 	puts args[:s]
# 	File.open(args[:s], "w+") { |file| file.write("boo!") }
# end


task :thing, [:foo] do |task, args|
  puts args[:foo]
end

#use rake thing [foo]

file :pagseguro, [:s] do |file, args|


 	aux  =  args[:s] + ".rb"
 	puts aux
 	File.open(aux, "w+") { |file| file.write(args[:s]) }
end