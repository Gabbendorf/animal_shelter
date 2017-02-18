class Ui

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def menu_options
    puts "1 - Show all animals"
    puts "2 - Show all clients"
    puts "3 - Add an animal"
    puts "4 - Add a client"
    puts "5 - Adopt an animal"
    # puts "6 - Save list"
    puts "0 - Quit"
  end

  def option_chosen
    gets.chomp
  end

  def shows_animals(animal_list)
     if animal_list.length >= 1
       animal_list.each do |animal|
         if animal.age != 1
           puts "#{animal.name} is a #{animal.type} and is #{animal.age} years old."
         else
           puts "#{animal.name} is a #{animal.type} and is #{animal.age} year old."
         end
        end
        puts ""
      else
       puts "There are no animals in the shelter."
     end
  end

  def shows_clients(list)
     if list.length >= 1
       list.each do |client|
         puts "Name: #{client.full_name}"
         puts "Date of birth: #{client.date_of_birth}"
         puts "Email address: #{client.email_address}"
         if client.animals_adopted.length < 1
           puts "No animals adopted yet."
         else
           puts "Animals adopted: #{client.animals_adopted}"
         end
         puts ""
       end
      else
       puts "There are no registered clients yet."
     end
  end

  def ask_animal_details(shelter, validations)
    puts "Please provide details of the animal to add:"
    puts "Name of the animal?"
    name = gets.chomp
    puts "Age of the animal?"
    age = gets.chomp
    age = validations.validate_animal_age(age)
    puts "Type of animal?"
    type = gets.chomp
    shelter.add_animal(name, age, type)
    puts "New animal added."
  end

  def add_another_animal
    puts "Do you wish to add another animal?"
    gets.chomp
  end

  def add_new_client(client_list, validations)
    puts "Full name:"
    full_name = gets.chomp
    full_name = validations.validate_user_name(full_name)
    puts "Date of birth (dd/mm/yyyy):"
    date_of_birth = gets.chomp
    date_of_birth = validations.validate_date_of_birth(date_of_birth)
    puts "Email address:"
    email_address = gets.chomp
    email_address = validations.validate_email_address(email_address)
    puts "Animals:"
    animals_adopted = "No animals"
    client_list.add_client(full_name, date_of_birth, email_address, animals_adopted)
    puts "New client added."
  end

  def add_another_client
    puts "Do you wish to add another client?"
    gets.chomp
  end

  def return_to_menu
    puts "Do you wish to return to the menu?"
    gets.chomp
  end

  def invalid_menu_option
    @stdout.puts "Option not available. Please enter a valid option."
    @stdin.gets.chomp
  end

  def invalid_animal_age
    @stdout.puts "The age must be a valid number."
    @stdout.puts "Age of the animal?"
    @stdin.gets.chomp
  end

  def invalid_animal_name
    @stdout.puts "Please enter a name for the animal to add:"
    @stdin.gets.chomp
  end

  def yes_or_no
    @stdout.puts "This input is wrong. Please reply with \"yes\" or \"no\""
    @stdin.gets.chomp
  end

  def invalid_user_name
    @stdout.puts "Please enter a full valid name (first name, middle name if any, surname)."
    @stdin.gets.chomp
  end

  def invalid_email_address
    @stdout.puts "Please enter a valid email address."
    @stdin.gets.chomp
  end

  def invalid_date_of_birth
    @stdout.puts "The date of birth should be in a valid format (dd/mm/yyyy)."
    @stdin.gets.chomp
  end

  def unlikely_year
    puts "Please ensure that the year is correct."
    gets.chomp
  end

  def user_too_young
    puts "You must be at least 15 years old to register."
    gets.chomp
  end

  def user_has_to_register_first
    puts "You must register first."
  end

  def gets_name_of_animal_to_adopt
    puts "Name of animal to adopt:"
    gets.chomp
  end

  def non_existing_animal
    puts "This animal is not included in the list."
    puts "Please choose an animal from the list:"
    gets.chomp
  end

  def name_of_user_who_adopts
    puts "Full name of person who wants to adopt:"
    gets.chomp
  end

  def adopt_other_animal
    puts "Do you want to adopt another animal?"
    gets.chomp
  end

  def say_goodbye
    puts "See you soon!"
  end

end
