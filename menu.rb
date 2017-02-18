require_relative 'ui'
require_relative 'adoption'

class Menu

  def initialize(ui, validations, client_list, shelter)
    @ui = ui
    @validations = validations
    @client_list = client_list
    @shelter = shelter
    @adoption = Adoption.new
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
      elsif @shelter.animal_list.length < 1
        @ui.shows_animals(@shelter.animal_list)
      else
        adopt_animal
        reply = @ui.adopt_other_animal
        reply = @validations.validate_yes_replies(reply)
        while reply == "yes"
          adopt_animal
          reply = @ui.adopt_other_animal
          reply = @validations.validate_yes_replies(reply)
        end
      end
    end

    # if option == 6
    #   @shelter.save_animal_list
    # end

    if option == 0
      @ui.say_goodbye
      exit
    end
  end

  def adopt_animal
    @ui.shows_animals(@shelter.animal_list)
    animal = @ui.gets_name_of_animal_to_adopt
    @adoption.adopt(animal)
    @ui.name_of_user_who_adopts
  end

end
