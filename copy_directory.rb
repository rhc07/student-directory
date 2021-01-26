
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
     i = 0
     while i < students.count
       puts "#{i + 1}: #{students[i][:name]} (#{students[i][:cohort]})"
       i += 1
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

students = input_students

print_header
print(students)
print_footer(students)
