
@students = []

def input_students
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.gsub(/[\n]/, "")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort infomation
    puts "Please enter the student's cohort"
    cohort_month = gets.gsub(/[\n]/, "").to_sym
    # checking input is an actual month/ checking for typos
    until months.include?(cohort_month)
      # if input left blank, default value set to :september
      if cohort_month == :""
        cohort_month = :September
      # if input no a month, user re-prompted
      else
        puts "Please enter the student's cohort"
        cohort_month = gets.gsub(/[\n]/, "").to_sym
      end
    end
    # get hobbies infomation
    puts "Please enter the student's hobbies"
    student_hobbies = gets.gsub(/[\n]/, "")
    # get country of birth infomation
    puts "Please enter the student's country of birth"
    student_country_of_birth = gets.gsub(/[\n]/, "")
    # get height infomation
    puts "Please enter the student's height"
    student_height = gets.gsub(/[\n]/, "")
    # add the student hash to the array
    @students << {name: name, cohort: cohort_month, hobbies: student_hobbies, country_of_birth: student_country_of_birth, height: student_height}
    if @students.count == 1
      puts "Now we have 1 student\n\n"
    else
      puts "Now we have #{@students.count} students\n\n"
    end
    # get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.gsub(/[\n]/, "")
  end
  # if no students exit program
  if @students.empty?
    exit
  end
end

def interactive_menue
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. do what the user has asked
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "9"
      # exit the program
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  line_width = 100
  puts "\n\n\n\n\n"
  puts "The students of Villains Academy".center(line_width)
  puts "".center(line_width,"-")
end

def print_students_list
  possible_cohorts = []
  @students.each do |student|
    unless possible_cohorts.include?(student[:cohort])
      possible_cohorts << student[:cohort]
    end
  end

  line_width = 100
  possible_cohorts.sort!
  possible_cohorts.each do |cohort|
    @students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]}" + ("(#{student[:height]}cm, #{student[:country_of_birth]}, #{student[:cohort].capitalize} cohort, Hobbies include: #{student[:hobbies]})").rjust(line_width - ("#{student[:name]}").length)
      end
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end





interactive_menue
