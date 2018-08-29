=begin
#first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :November},
  {name: "Darth Vader", cohort: :November},
  {name: "Nurse Ratched", cohort: :November},
  {name: "Michael Corleone", cohort: :November, height: 1000, hobbies: "golf, tennis, racing, pkere------"},
  {name: "Alex DeLarge", cohort: :November},
  {name: "The Wicked Witch of the West", cohort: :November},
  {name: "Terminator", cohort: :November},
  {name: "Freddy Krueger", cohort: :November},
  {name: "The Joker", cohort: :September},
  {name: "Joffrey Baratheom", cohort: :October},
  {name: "Norman Bates", cohort: :March},
]
=end

def input_students
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
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
    students << {name: name, cohort: cohort_month, hobbies: student_hobbies, country_of_birth: student_country_of_birth, height: student_height}
    if students.count == 1
      puts "Now we have 1 student\n\n"
    else
      puts "Now we have #{students.count} students\n\n"
    end
    # get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.gsub(/[\n]/, "")
  end
  # if no students exit program
  if students.empty?
    exit
  end
  # return the array of students
  students
end

def print_header
  line_width = 100
  puts "\n\n\n\n\n"
  puts "The students of Villains Academy".center(line_width)
  puts "".center(line_width,"-")
end

def print(students)
  possible_cohorts = []
  students.each do |student|
    unless possible_cohorts.include?(student[:cohort])
      possible_cohorts << student[:cohort]
    end
  end

  line_width = 100
  possible_cohorts.sort!
  possible_cohorts.each do |cohort|
    students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]}" + ("(#{student[:height]}cm, #{student[:country_of_birth]}, #{student[:cohort].capitalize} cohort, Hobbies include: #{student[:hobbies]})").rjust(line_width - ("#{student[:name]}").length)
      end
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
