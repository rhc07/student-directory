@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from stduents.csv"
  puts "5. Find student by first letter"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def interactive_menu
  loop do
    print print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
     when "1"
       input_students
     when "2"
       show_students
     when "3"
       save_students
     when "4"
       load_students
     when "5"
       print_by_first_letter
     when "9"
       exit
     else
       puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp
  cohort = :November
  while !name.empty? do
    add_student(name, cohort)
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_header
puts "The students of Villains Academy"
puts  "-------------"
end


def print_student_list
  index = 0
  while index < @students.count do
    puts " #{index + 1}: #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
    index += 1
  end
end


def print_by_name_length
  if @students.empty?
    puts "No students available."
  else
    puts "Names with maximum characters: (Please enter a number)"
    max_length = gets.strip
    number_of_matches = 0
    @students.each do |student|
       if student[:name].length <= max_length.to_i
         puts "#{student[:name]}, (#{student[:cohort]} cohort)".
         number_of_matches += 1
       end
    end
  end
puts "We have #{number_of_matches} with a name of #{max_length} characters."
end



def print_by_first_letter
  if @students.empty?
    puts "No students available."
  else
    puts "Students name beginning with: (Please enter a letter)"
    letter = gets.strip
    number_of_matches = 0
    @students.each do |student|
      if student[:name].start_with?(letter.upcase, letter.downcase)
         puts "#{student[:name]}, (#{student[:cohort]} cohort)"
         number_of_matches += 1
      end
    end
  end
puts "We have #{number_of_matches} whose name begins with #{letter}."
end

def print_footer
   puts "Overall, we have #{@students.count} great students."
end



def add_student(name, cohort)
  @students << {name: name, cohort: :november}
end


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end


def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

interactive_menu
