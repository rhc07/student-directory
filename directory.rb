def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp
     case selection
     when "1"
       students = input_students
     when "2"
       print_header
       print(students)
       print_footer(students)
     when "9"
       exit
     else
       puts "I don't know what you meant, try again"
    end
 end
end




def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
 students
end


def print_header
puts "The students of Villains Academy"
puts  "-------------"
end

def print(students)
index = 0
while index < students.count do
  puts " #{index + 1}: #{students[index][:name]} (#{students[index][:cohort]} cohort)"
index += 1
end

puts "Students name beginning with: (Please enter a letter)"
letter = gets.chomp
puts "Names with maximum characters: (Please enter a number)"
max_length = gets.chomp

number_of_matches = 0
 students.each do |student|
  if student[:name].start_with?(letter.upcase, letter.downcase)
   if student[:name].length <= max_length.to_i
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

interactive_menu
print_header
print(students)
print_footer(students)
