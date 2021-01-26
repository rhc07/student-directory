def create_student
  puts "Would you like to add a student to the system? (y/n)"
  continue = gets.chomp
    if continue == "y"
      return true
    elsif continue == "n"
      return false
    else
      "Invalid choice"
    end
  create_student
end


def input_students

  students = []
  continue = create_student
  while continue == true do

  puts "Please enter the name of the student"
  name = gets.chomp

  puts "please enter the country of birth"
  country_of_birth = gets.chomp

  puts "please enter student height(cm)"
  height = gets.chomp

  hobbies = add_hobbies

  students << { name: name, cohort: :november, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
     puts "Now we have #{students.count} students"
     continue = create_student
  end
 students
end

def add_hobbies
hobbies = []
  puts "Please enter student's hobbies"
  puts "To finish, just hit return twice"
  hobby = gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end


def print_header
puts "The students of Villains Academy"
puts  "-------------"
end


def print(students)
     index = 0
     while index < students.count
       puts "#{index + 1}: #{students[index][:name]}, #{students[index][:country_of_birth]}, (#{students[index][:height]}cm), (#{students[index][:cohort]} cohort), (hobbies: #{students[index][:hobbies]})"
       index += 1
     end
end


def print_by_character(students)
  puts "Students name beginning with: (Please enter a letter)"
  letter = gets.chomp
  puts "Names with maximum characters: (Please enter a number)"
  max_length = gets.chomp

  number_of_matches = 0
  students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
     if student[:name].length <= max_length.to_i
       puts "#{student[:name]}, #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
       number_of_matches += 1
     end
    end
   end
 puts "We have #{number_of_matches} names that begin with #{letter}."
 puts "We have #{number_of_matches} names with #{max_length} characters."
end


def print_footer(students)
   puts "Overall, we have #{students.count} great students."
end

students = input_students

print_header
print(students)
print_by_character(students)
print_footer(students)
