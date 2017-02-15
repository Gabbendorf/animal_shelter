require_relative 'shelter'
require_relative 'ui'
require_relative 'validations'
require_relative 'menu'
require_relative 'client_list'

ui = Ui.new($stdin, $stdout)
shelter = Shelter.new
client_list = ClientList.new
validations = Validations.new(ui)
menu = Menu.new(ui, validations, client_list, shelter)


continue = true
while continue
  ui.menu_options
  option = ui.option_chosen
  option = validations.validate_option_chosen(option)
  menu.choose(option)
  reply = ui.return_to_menu
  reply = validations.validate_yes_replies(reply)
  if reply != "yes"
    ui.say_goodbye
    continue = false
  end
end
