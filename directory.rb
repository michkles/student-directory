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
    students = []
    puts "What is your name?"
    name = gets.gsub(/\n/, '').to_sym
      if !name.empty?
        puts "What is your cohort"
          cohort = gets.gsub(/\n/, '').to_sym
            if cohort.empty?
              cohort = "September"
            end
        puts "What is your hobby?"
          hobby = gets.gsub(/\n/, '').to_sym
        puts "What is your country of birth?"
          country = gets.gsub(/\n/, '').to_sym
        puts "What is your height?"
          height = gets.gsub(/\n/, '').to_sym
        puts "Is everything correct?"
            typo = gets.gsub(/\n/, '')
            if typo == "no"
              puts "Just type one of the following: name, cohort, hobby, coutry or height"
              input = gets.gsub(/\n/, '')
              case input
              when "name"
                 puts "What is your name"
                 name = gets.gsub(/\n/, '').to_sym
              when "cohort"
                 puts "What is your cohort"
                 cohort = gets.gsub(/\n/, '').to_sym
                   if cohort.empty?
                     cohort = "September".to_sym
                   end
              when "hobby"
                puts "What is your hobby?"
                hobby = gets.gsub(/\n/, '').to_sym
              when "country"
                puts "What is your country of birth?"
                country = gets.gsub(/\n/, '').to_sym
              when "height"
                puts "What is your height?"
                height = gets.gsub(/\n/, '').to_sym
              else
                puts "dont' make it harder! :)"
              end
            end
      end


    while !name.empty? do
      @students << {name: name, cohort: cohort, hobby: hobby, country: country, height: height}
      a = @students.count
      unless a > 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{a} students"
      end

      puts "What is your name?"
        name = gets.gsub(/\n/, '').to_sym
          if !name.empty?
            puts "What is your cohort"
              cohort = gets.gsub(/\n/, '').to_sym
                if cohort.empty?
                  cohort = "September".to_sym
                end
            puts "What is your hobby?"
              hobby = gets.gsub(/\n/, '').to_sym
            puts "What is your country of birth?"
              country = gets.gsub(/\n/, '').to_sym
            puts "What is your height?"
              height = gets.gsub(/\n/, '').to_sym
              puts "Is everything correct?"
                  typo = gets.gsub(/\n/, '')
                  if typo == "no"
                    puts "Just type one of the following: name, cohort, hobby, coutry or height"
                    input = gets.gsub(/\n/, '')
                    case input
                    when "name"
                       puts "What is your name"
                       name = gets.gsub(/\n/, '').to_sym
                    when "cohort"
                       puts "What is your cohort"
                       cohort = gets.gsub(/\n/, '').to_sym
                         if cohort.empty?
                           cohort = "September"
                         end
                    when "hobby"
                      puts "What is your hobby?"
                      hobby = gets.gsub(/\n/, '').to_sym
                    when "country"
                      puts "What is your country of birth?"
                      country = gets.gsub(/\n/, '').to_sym
                    when "height"
                      puts "What is your height?"
                      height = gets.gsub(/\n/, '').to_sym
                    else
                      puts "dont' make it harder! :)"
                    end
                  end
          end
    end

    #students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
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
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3.Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobby], student[:country],student[:height]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
end
interactive_menu
