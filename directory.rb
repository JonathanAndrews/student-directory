=begin
#first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november, height: 1000, hobbies: "golf, tennis, racing, pkere------"},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheom", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]
=end

def input_students
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort infomation
    puts "Please enter the student's cohort"
    cohort_month = gets.chomp.to_sym
    # checking input is an actual month/ checking for typos
    until months.include?(cohort_month)
      # if input left blank, default value set to :september
      if cohort_month == :""
        cohort_month = :September
      # if input no a month, user re-prompted
      else
        puts "Please enter the student's cohort"
        cohort_month = gets.chomp.to_sym
      end
    end
    # get hobbies infomation
    puts "Please enter the student's hobbies"
    student_hobbies = gets.chomp
    # get country of birth infomation
    puts "Please enter the student's country of birth"
    student_country_of_birth = gets.chomp
    # get height infomation
    puts "Please enter the student's height"
    student_height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort_month, hobbies: student_hobbies, country_of_birth: student_country_of_birth, height: student_height}
    puts "Now we have #{students.count} students\n\n"
    # get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
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
  line_width = 100
  students.each do |student|
    puts "#{student[:name]}" + ("(#{student[:height]}cm, #{student[:country_of_birth]}, #{student[:cohort].capitalize} cohort, Hobbies include: #{student[:hobbies]})").rjust(line_width - ("#{student[:name]}").length)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
