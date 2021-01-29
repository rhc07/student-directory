@students = []
@loaded_filename = ""
@default_filename = "students.csv"

def header_menu
  divider
  puts "---- Student Directory ----"
  puts "-- Using file: #{@loaded_filename}."
  divider
end


def print_menu
  header_menu
  puts "---- MAIN MENU ----"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
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
       save_file_preference
     when "4"
       load_file_preference
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
  name, cohort = STDIN.gets.chomp, :November
  while !name.empty? do
    add_student(name, cohort)
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def divider
  puts  "-------------".center(28)
end

def print_header
puts "The students of Villains Academy"
divider
end


def print_student_list
  if @students.empty?
    puts "No students available."
  else
    index = 0
    while index < @students.count do
      puts " #{index + 1}: #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
      index += 1
    end
  end
end


def print_by_name_length
  if @students.empty?
    puts "No students available."
  else
    puts "Names with maximum characters: (Please enter a number)"
    max_length, number_of_matches = gets.strip, 0
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
    letter, number_of_matches = gets.strip, 0
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


def save_file_preference
  puts "Please enter the name of the file"
  filename = gets.chomp
  filename.empty? ? save_students : save_students(filename)
end

def save_students(filename = @default_filename)
  puts "Please enter the filename."
  filename = gets.chomp
  file = File.open(filename, "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts ""
  puts "Students successfully saved in #{filename}."
  puts ""
end
end

def load_file_preference
  puts "Please select a file."
  puts "Hit return twice to load the default file, students.csv."
  filename = gets.chomp
  filename.empty? ? load_students : load_students(filename)
end

def load_students(filename = @default_filename)
  file = File.open(filename, "r")do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  puts
  puts "Students successfully loaded from #{filename}."
  puts
end
end


def try_load_students
  filename = ARGV.first
    if filename.nil?
      puts
      puts "Loaded the default file: #{@default_filename}"
      puts
      @loaded_filename = @default_filename
      load_students
    elsif File.exists?(filename)
      @loaded_filename = filename
      load_students(filename)
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
  end
end

try_load_students
interactive_menu
