
studentz = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(arg)
    #new = arg.select {|item| item[:name].length < 12}
    #new = arg.select {|item| item[:name][0] == ?D}
    #new.each_with_index do |item, index|
    #  puts "#{index + 1}.#{item[:name]} (#{item[:cohort]} cohort)"
    #end
  i = 0
  lgth = arg.length
  while i < lgth
    puts "#{i+1}.#{arg[i][:name]} (#{arg[i][:cohort]} cohort)"
    i+=1
  end



end


def print_footer(arg)
puts "Overall, we have #{arg.count} great students"
end

def input_students
    puts "please enter the names of the students"
    puts "to finish, just hit return twice"
    # now create an empty array
    students = []
    input = gets.chomp

    while !input.empty? do
      students << {name: input, cohort: :november}
      puts "Now we have #{students.count} students"
      input = gets.chomp
    end

    students
end

students = input_students
print_header
print(students)
print_footer(students)
