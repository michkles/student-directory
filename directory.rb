@students = []

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list
    #new = arg.select {|item| item[:name].length < 12}
    #new = arg.select {|item| item[:name][0] == ?D}
    #new.each_with_index do |item, index|
    #  puts "#{index + 1}.#{item[:name]} (#{item[:cohort]} cohort)"
    #end
  if !@students.empty?
  sort_by = @students.sort_by{|x| x[:cohort]}
  i = 0
  lgth = sort_by.length
    while i < lgth
      width = 50
      puts   "#{i+1}.#{sort_by[i][:name]}".center(width)
      puts   "Hobby: #{sort_by[i][:hobby]}".center(width)
      puts   "Country: #{sort_by[i][:country]}".center(width)
      puts   "Height: #{sort_by[i][:height]}".center(width)
      puts   "(#{sort_by[i][:cohort]} cohort)".center(width)
      i+=1
    end
  end
end


def print_footer
puts "Overall, we have #{@students.count} great students"
end

def input_students
    puts "please enter the names of the students"
    puts "to finish, just hit return twice"
    # now create an empty array
    #students = []
    puts "What is your name?"
    name = STDIN.gets.gsub(/\n/, '')
      if !name.empty?
        puts "What is your cohort"
          cohort = STDIN.gets.gsub(/\n/, '').to_sym
            if cohort.empty?
              cohort = "September".to_sym
            end
        puts "What is your hobby?"
          hobby = STDIN.gets.gsub(/\n/, '')
        puts "What is your country of birth?"
          country = STDIN.gets.gsub(/\n/, '')
        puts "What is your height?"
          height = STDIN.gets.gsub(/\n/, '')
        puts "Is everything correct?"
            typo = STDIN.gets.gsub(/\n/, '')
            if typo == "no"
              puts "Just type one of the following: name, cohort, hobby, coutry or height"
              input = STDIN.gets.gsub(/\n/, '')
              typo_met(input)
            end
      end


    while !name.empty? do
      students_add(name, cohort, hobby, country, height)
      a = @students.count
      unless a > 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{a} students"
      end

      puts "What is your name?"
        name = STDIN.gets.gsub(/\n/, '')
          if !name.empty?
            puts "What is your cohort"
              cohort = STDIN.gets.gsub(/\n/, '').to_sym
                if cohort.empty?
                  cohort = "September".to_sym
                end
            puts "What is your hobby?"
              hobby = STDIN.gets.gsub(/\n/, '')
            puts "What is your country of birth?"
              country = STDIN.gets.gsub(/\n/, '')
            puts "What is your height?"
              height = STDIN.gets.gsub(/\n/, '')
              puts "Is everything correct?"
                  typo = STDIN.gets.gsub(/\n/, '')
                  if typo == "no"
                    puts "Just type one of the following: name, cohort, hobby, coutry or height"
                    input = STDIN.gets.gsub(/\n/, '')
                    typo_met(input)
                  end
          end
    end

end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "Enter name of the file to load:"
      filename = gets.chomp
      load_students(filename)
    when "9"
      puts "Exiting now..."
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list from a file:"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
    puts "Enter name of the file:"
    input = gets.chomp
    file = File.open(input, "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobby], student[:country],student[:height]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
    puts "File saved successfully"
end

def load_students(filename = "students.csv")
  file = File.open(filename , "r")
  file.readlines.each do |line|
    name, cohort, hobby, country, height = line.chomp.split(',')
    students_add(name, cohort, hobby, country, height)
    end
    file.close
    puts "File loaded successfully"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def students_add(name, cohort, hobby, country, height)
  @students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: country, height: height}
end

def questions

end

def typo_met(input)
  case input
  when "name"
     puts "What is your name?"
     name = STDIN.gets.gsub(/\n/, '')
  when "cohort"
     puts "What is your cohort"
     cohort = STDIN.gets.gsub(/\n/, '').to_sym
       if cohort.empty?
         cohort = "September".to_sym
       end
  when "hobby"
    puts "What is your hobby?"
    hobby = STDIN.gets.gsub(/\n/, '')
  when "country"
    puts "What is your country of birth?"
    country = STDIN.gets.gsub(/\n/, '')
  when "height"
    puts "What is your height?"
    height = STDIN.gets.gsub(/\n/, '')
  else
    puts "dont' make it harder! :)"
  end
end


try_load_students
interactive_menu
