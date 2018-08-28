=begin
#first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
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
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:height]}cm, #{student[:country_of_birth]}, #{student[:cohort].capitalize} cohort, hobbies include: #{student[:hobbies]})"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
