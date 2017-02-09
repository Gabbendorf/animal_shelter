require_relative 'shelter'
require_relative 'ui'
require_relative 'validations'
require_relative 'menu'
require_relative 'client_list'

ui = Ui.new
shelter = Shelter.new
validations = Validations.new
# menu = Menu.new
client_list = ClientList.new

continue = true
while continue
  ui.menu_options
  option = ui.option_chosen
  option = validations.validate_option_chosen(option)
  # menu.choose(option)

  no = "Function not available. Work in progress!"
  if option == 1
    ui.shows_animals(shelter.animal_list)
  end

  if option == 2
    ui.shows_clients(client_list.list)
  end

  if option == 3
    ui.ask_animal_details(shelter, validations)
    reply = ui.add_another_animal
  # --> should say "input invalid" each time it asks if user
  # wants to add a new animal and input is wrong}
    # says_yes = true
    # while true
      reply = validations.validate_yes_replies(reply)
      if reply == "yes"
        ui.ask_animal_details(shelter, validations)
        ui.add_another_animal
        # says_yes = false
      end
    # end
  end

  if option == 4
    ui.add_new_client(client_list)
    reply = ui.add_another_client
    reply = validations.validate_yes_replies(reply)
      if reply == "yes"
        ui.add_new_client(client_list)
        ui.add_another_client
      end
  end

  if option == 5
    puts no
  end

  if option == 0
    ui.say_goodbye
    exit
  end
  #conditionals.all_options(option)
  reply = ui.return_to_menu
  reply = validations.validate_yes_replies(reply)
  if reply != "yes"
    ui.say_goodbye
    continue = false
  end
end
