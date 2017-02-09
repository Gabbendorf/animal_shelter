class Ui

  def menu_options
    puts "1 - Show all animals"
    puts "2 - Show all clients"
    puts "3 - Add an animal"
    puts "4 - Add a client"
    puts "5 - Adopt an animal"
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
      else
       puts "There are no animals in the shelter."
     end
  end

  def shows_clients(list)
     if list.length >= 1
       list.each do |client|
         puts "Name: #{client.full_name}"
         puts "Date of birth: #{client.date_of_birth}"
         puts "Contact detail: #{client.contact_details}"
         puts ""
       end
      else
       puts "There are no registered clients yet."
     end
  end

  def ask_animal_details(shelter, validations)
  # --> wanted to ask the user to enter details or "quit" if they want to
  # return to menu. Started writing code but got stuck
    puts "Please provide details of the animal to add:"
    puts "Name of the animal?"
    name = gets.chomp
    puts "Age of the animal?"
    age = gets.chomp
    age = validations.validate_age(age)
    puts "Type of animal?"
    type = gets.chomp
    shelter.add_animal(name, age, type)
    puts "New animal added."
  end

  def add_another_animal
    puts "Do you wish to add another animal?"
    gets.chomp
  end

  def add_new_client(client_list)
    puts "Full name:"
    full_name = gets.chomp
    puts "Date of birth (DD/MM/YYYY):"
    date_of_birth = gets.chomp
    puts "Contact detail (either a phone number or an email address):"
    contact_details = gets.chomp
    client_list.add_client(full_name, date_of_birth, contact_details)
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

  def say_goodbye
    puts "See you soon!"
  end

  def invalid_menu_option
    puts "Option not available. Please enter a valid option."
    gets.chomp
  end

  def invalid_age
    puts "The age must be a valid number."
    puts "Age of the animal?"
    gets.chomp
  end

  def yes_or_no
    puts "This input is wrong. Please reply with \"yes\" or \"no\""
    gets.chomp
  end

end
