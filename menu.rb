require_relative 'ui'

class Menu

  def initialize(ui, validations, client_list, shelter)
    @ui = ui
    @validations = validations
    @client_list = client_list
    @shelter = shelter
  end

  def choose(option)
    if option == 1
      @ui.shows_animals(@shelter.animal_list)
    end

    if option == 2
      @ui.shows_clients(@client_list.list)
    end

    if option == 3
      @ui.ask_animal_details(@shelter, @validations)
      reply = @ui.add_another_animal
      reply = @validations.validate_yes_replies(reply)
        while reply == "yes"
          @ui.ask_animal_details(@shelter, @validations)
          reply = @ui.add_another_animal
          reply = @validations.validate_yes_replies(reply)
        end
    end

    if option == 4
      @ui.add_new_client(@client_list, @validations)
      reply = @ui.add_another_client
      reply = @validations.validate_yes_replies(reply)
      # it stops asking to add new client after 2 times, then it ask
      # to return to menu
        while reply == "yes"
          @ui.add_new_client(@client_list, @validations)
          reply = @ui.add_another_client
          reply = @validations.validate_yes_replies(reply)
        end
    end

    if option == 5
      if @client_list.list.length < 1
        @ui.user_has_to_register_first
        @ui.menu_options
      end

      if @shelter.animal_list.length < 1
        @ui.shows_animals(@shelter.animal_list)
      else
        @ui.choose_animal
        @ui.shows_animals(@shelter.animal_list)
        @ui.gets_users_choice_of_animal
      end
    end

    if option == 0
      @ui.say_goodbye
      exit
    end
  end

end
