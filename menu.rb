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
        if reply == "yes"
          @ui.ask_animal_details(@shelter, @validations)
          @ui.add_another_animal
        end
    end

    if option == 4
      @ui.add_new_client(@client_list, @validations)
      reply = @ui.add_another_client
      reply = @validations.validate_yes_replies(reply)
        if reply == "yes"
          @ui.add_new_client(@client_list, @validations)
          @ui.add_another_client
        end
    end

    if option == 5
      if @shelter.animal_list.length < 1
        @ui.shows_animals(@shelter.animal_list)
      else
        @ui.choose_animal
        @ui.shows_animals(@shelter.animal_list)
      end
    end

    if option == 0
      @ui.say_goodbye
      exit
    end
  end

end
