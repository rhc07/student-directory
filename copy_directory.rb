
@width = 75

def create_student
  puts "Would you like to add a student to the system? (y/n)".center(@width)
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

  puts "Please enter the name of the student".center(@width)
  name = gets.chomp

  puts "please enter the country of birth".center(@width)
  country_of_birth = gets.chomp

  puts "please enter student height(cm)".center(@width)
  height = gets.chomp

  hobbies = add_hobbies

  students << { name: name, cohort: :november, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
     puts "Now we have #{students.count} students".center(@width)
     continue = create_student
  end
 students
end

def add_hobbies
hobbies = []
  puts "Please enter student's hobbies".center(@width)
  puts "To finish, just hit return twice".center(@width)
  hobby = gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end


def print_header
puts "The students of Villains Academy".center(@width)
puts  "-------------".center(@width)
end


def print(students)
     index = 0
     while index < students.count
       puts "#{index + 1}: #{students[index][:name]}, #{students[index][:country_of_birth]}, (#{students[index][:height]}cm), (#{students[index][:cohort]} cohort), (hobbies: #{students[index][:hobbies]})".center(@width)
     end
end


def print_by_character(students)
  puts "Students name beginning with: (Please enter a letter)".center(@width)
  letter = gets.chomp
  puts "Names with maximum characters: (Please enter a number)".center(@width)
  max_length = gets.chomp

  number_of_matches = 0
  students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
     if student[:name].length <= max_length.to_i
       puts "#{student[:name]}, #{student[:country_of_birth]} (#{student[:cohort]} cohort)".center(@width)
       number_of_matches += 1
     end
    end
   end
 puts "We have #{number_of_matches} names that begin with #{letter}.".center(@width)
 puts "We have #{number_of_matches} names with #{max_length} characters.".center(@width)
end


def print_footer(students)
   puts "Overall, we have #{students.count} great students.".center(@width)
end

students = input_students

print_header
print(students)
print_by_character(students)
print_footer(students)
