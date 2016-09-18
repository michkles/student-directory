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
  if !arg.empty?
  sort_by = arg.sort_by{|x| x[:cohort]}
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


def print_footer(arg)
puts "Overall, we have #{arg.count} great students"
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
      students << {name: name, cohort: cohort, hobby: hobby, country: country, height: height}
      a = students.count
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

    students
end

students = input_students
print_header
print(students)
print_footer(students)
