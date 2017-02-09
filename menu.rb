require_relative 'ui'

class Menu

  def choose(option)
    if option == 1
      shows_animals(shelter.animal_list)
    end

    if option == 2
      shows_clients(client_list.list)
    end

    if option == 3
      ask_animal_details(shelter, validations)
      another = add_another_animal
      if another == "yes"
        ask_animal_details
        add_another_animal
      else
        return_to_menu
      end
    end

    if option == 4
      add_new_client(client_list)
      reply = add_another_client
      reply = validations.validate_yes_replies(reply)
        if reply == "yes"
          add_new_client(client_list)
          add_another_client
        end
    end

    no = "Function not available. Work in progress!"
    if option == 5
      puts no
    end

    if option == 0
      say_goodbye
      exit
    end
  end

end
