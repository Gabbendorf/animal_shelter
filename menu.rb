require_relative 'ui'

class Menu

  def initialize
    @ui = Ui.new
  end

  def initialize
    @shelter = Shelter.new
  end

  def choose(option)
    if option == 1
      @ui.shows_animals(animal_list)
    end

    if option == 2
      @ui.shows_clients(client_list.list)
    end

    if option == 3
      @ui.ask_animal_details(shelter, validations)
      another = @ui.add_another_animal
      if another == "yes"
        @ui.ask_animal_details
        @ui.add_another_animal
      else
        @ui.return_to_menu
      end
    end

    if option == 4
      @ui.add_new_client(client_list)
      reply = @ui.add_another_client
      reply = validations.validate_yes_replies(reply)
        if reply == "yes"
          @ui.add_new_client(client_list)
          @ui.add_another_client
        end
    end

    no = "Function not available. Work in progress!"
    if option == 5
      puts no
    end

    if option == 0
      @ui.say_goodbye
      exit
    end
  end

end
