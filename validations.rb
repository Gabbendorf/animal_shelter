require_relative 'ui'
require 'date'

class Validations

  def initialize(ui)
    @ui = ui
  end

  def validate_option_chosen(option)
    available_options = ["0", "1", "2", "3", "4", "5"]
    while option != option.to_i.to_s || !available_options.include?(option)
      # "any letters".to_i.to_s returns always "0", whereas
      # "any numbers".to_i.to_s returns "same numbers", therefore for the former
      # the above statement is true, for the latter is false (same below)
      option = @ui.invalid_menu_option
    end
    option.to_i
  end

  def validate_animal_age(age)
    while age != age.to_i.to_s || age <= "0"
      age = @ui.invalid_animal_age
    end
    age.to_i
  end

  def validate_animal_name(name)
    while name == "\n"
      name = @ui.invalid_animal_name
    end
    name
  end

  def validate_yes_replies(reply)
    while reply != "yes" && reply != "no"
      reply = @ui.yes_or_no
    end
    reply
  end

  def validate_email_address(email_address)
    while !email_address.include?("@") || !email_address.include?(".")
      email_address = @ui.invalid_email_address
    end
    email_address
  end

  def validate_date_of_birth(date_of_birth)
    validation_result = is_valid_date_of_birth(date_of_birth)
    while validation_result != true
      if validation_result == "unlikely year"
        date_of_birth = @ui.unlikely_year
      elsif validation_result == "too young"
        date_of_birth = @ui.user_too_young
      else
        date_of_birth = @ui.invalid_date_of_birth
      end
      validation_result = is_valid_date_of_birth(date_of_birth)
    end
    date_of_birth
  end

  def is_valid_date_of_birth(date_of_birth)
    splitted_date = date_of_birth.split("/")
    if splitted_date.length != 3
      return "invalid"
    end
    begin
      date_of_birth = Date.new(
        splitted_date[2].to_i,
        splitted_date[1].to_i,
        splitted_date[0].to_i
      )
      if date_of_birth.year <= (Date.today.year - 120) || date_of_birth.year > Date.today.year
        return "unlikely year"
      elsif date_of_birth.year > (Date.today.year - 15)
        return "too young"
      else
        return true
      end
    rescue ArgumentError
      return "invalid"
    end
  end

  def validate_user_name(full_name)
    splitted_full_name = full_name.split(" ")
    while splitted_full_name.length < 2
      full_name = @ui.invalid_user_name
      splitted_full_name = full_name.split(" ")
    end
    full_name = splitted_full_name.join(" ")
    full_name
  end

end
