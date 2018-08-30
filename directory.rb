
@students = []

def name_input_prompt
  puts "Please enter the name of the student."
  puts "To finish, just hit return twice."
  name = STDIN.gets.gsub(/[\n]/, "")
end

def cohort_input
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the student's cohort:"
  cohort_month = STDIN.gets.gsub(/[\n]/, "").to_sym
  # checking input is an actual month/ checking for typos
  until months.include?(cohort_month)
    # if input left blank, default value set to :september
    if cohort_month == :""
      cohort_month = :September
    # if input no a month, user re-prompted
    else
      puts "Please enter the student's cohort:"
      cohort_month = STDIN.gets.gsub(/[\n]/, "").to_sym
    end
  end
  cohort_month
end

def input_students
  name = name_input_prompt
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort infomation
    cohort_month = cohort_input
    # get other info
    info = additonal_student_info
    student_hobbies = info[0]
    student_country_of_birth = info[1]
    student_height = info[2]
    # add the student hash to the array
    shovel_student_hash_into_instance(name, student_height, student_country_of_birth, cohort_month, student_hobbies)
    confirmation_of_input
    # get another name from the user
    name = name_input_prompt
  end
  # if no students exit program
  if @students.empty?
    exit
  end
end

def additonal_student_info
  # get hobbies infomation
  puts "Please enter the student's hobbies:"
  student_hobbies = STDIN.gets.gsub(/[\n]/, "")
  # get country of birth infomation
  puts "Please enter the student's country of birth:"
  student_country_of_birth = STDIN.gets.gsub(/[\n]/, "")
  # get height infomation
  puts "Please enter the student's height:"
  student_height = STDIN.gets.gsub(/[\n]/, "")
  # return array
  [student_hobbies, student_country_of_birth, student_height]
end

def confirmation_of_input
  if @students.count == 1
    puts "Now we have 1 student.\n\n\n\n\n"
  else
    puts "Now we have #{@students.count} students.\n\n\n\n\n"
  end
end

def interactive_menue
  try_load_students
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "3"
      save_students
    when "4"
      puts "From where would you like to load the student data?"
      filename = STDIN.gets.gsub(/[\n]/, "")
      if  filename == ""
        load_students
      else
        load_students(filename)
      end
    when "9"
      # exit the program
      silly_exit
    else
      puts "I don't know what you meant, try again?"
  end
end

def silly_exit
  print "Program exiting"
  sleep(1)
  print "."
  sleep(1)
  print "."
  sleep(1)
  print ".\n"
  exit
end

def print_header
  line_width = 100
  puts "\n\n\n\n\n"
  puts "The students of Villains Academy".center(line_width)
  puts "".center(line_width,"-")
end

def list_of_cohorts
  possible_cohorts = []
  @students.each do |student|
    unless possible_cohorts.include?(student[:cohort])
      possible_cohorts << student[:cohort]
    end
  end
  possible_cohorts.sort.reverse
end

def print_students_list
  possible_cohorts = list_of_cohorts
  line_width = 100
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
  puts "\n\n\n"
end

def save_students
  puts "To where would you like to save the student data?"
  filename = STDIN.gets.gsub(/[\n]/, "")
  if filename == ""
    filename = "students.csv"
  end
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:height], student[:country_of_birth], student[:cohort].capitalize, student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student data saved to '#{filename}'\n\n\n\n"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    student_array = line.chomp.split(',')
    shovel_student_hash_into_instance(*student_array)
  end
  file.close
  puts "Student data loaded from '#{filename}'\n\n\n\n"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exits
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def shovel_student_hash_into_instance(name, student_height, student_country_of_birth, cohort_month, student_hobbies)
  @students << {name: name, cohort: cohort_month.to_sym, hobbies: student_hobbies, country_of_birth: student_country_of_birth, height: student_height}
end


interactive_menue
