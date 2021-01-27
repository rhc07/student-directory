
@width = 75
@students = []

@cohorts = {
  January: 0,
  February: 3,
  March: 0,
  April: 3,
  May: 0,
  June: 10,
  July: 20,
  August: 19,
  September: 0,
  October: 2,
  Novemvber: 1,
  December: 5
}


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

def add_cohort
  next_cohort = :April
  puts "Available cohorts"
  puts "(Month / Vacancies)"
  @cohorts.each do |month, vacancies|
    puts "#{month} - vacancies: #{vacancies}"
  end

  puts " "
  puts "Please enter the month of the cohort you'd like to join:"
  cohort = gets.chomp
  case cohort
  when "January"
    puts "January is full, you have been placed in February cohort."
    cohort = :February
  when "February"
    cohort = :February
  when "March"
    puts "March is full, you have been placed in April cohort."
    cohort = :April
  when "April"
    cohort = :April
  when "May"
    puts "May is full, you have been placed in June cohort."
    cohort = :June
  when "June"
    cohort = :June
  when "July"
    cohort = :July
  when "August"
    cohort = :August
  when "September"
    puts "September is full, you have been placed in October cohort."
    cohort = :October
  when "October"
    cohort = :October
  when "November"
    cohort = :November
  when "December"
    cohort = :December
  else
    puts "Input not recognised, you have been placed in the #{next_cohort} cohort."
    cohort = next_cohort
  end
cohort
end

def input_students

  continue = create_student
  while continue == true do

  puts "Please enter the name of the student".center(@width)
  name = gets.chomp

  cohort = add_cohort

  puts "Please enter the country of birth".center(@width)
  country_of_birth = gets.chomp

  puts "Please enter student height(cm)".center(@width)
  height = gets.chomp

  hobbies = add_hobbies

  @students << { name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
     puts "Now we have #{@students.count} students".center(@width)
     continue = create_student
  end
 @students
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


def print_student_list(students)
index = 0
  while index < @students.count
    puts "#{index + 1}: #{@students[index][:name]}, #{@students[index][:country_of_birth]}, (#{@students[index][:height]}cm), (#{@students[index][:cohort]} cohort), (hobbies: #{@students[index][:hobbies]})".center(@width)
    index += 1
  end
end

def print_by_cohort(students)
 if @students.empty?
   puts "No students avaialble"
 else
   cohorts = @students.map do |student|
     student[:cohort]
   end
   cohorts.uniq.each do |cohort|
     puts "#{cohort} cohort".upcase.center(@width)
      @students.each do |student|
        puts student[:name] if student[:cohort] == cohort
      end
    end
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

@students = input_students
print_header
print_student_list(@students)
print_by_cohort(@students)
print_by_character(@students)
print_footer(@students)
