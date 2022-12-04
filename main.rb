require_relative 'lib/console_interface'
require_relative 'lib/vending_machine'

vending_machine = VendingMachine.new
console_interface = ConsoleInterface.new(vending_machine)

until vending_machine.has_no_inventory?

  print console_interface.print_welcome_screen
  @deposit = console_interface.get_deposit

  break if @deposit == 0

  choice = console_interface.get_selection

  if vending_machine.invalid_selection?(choice)
    print console_interface.format_message('You have selected an invalid code')
  elsif vending_machine.out_of_stock?(choice)
    print console_interface.format_message('You have selected an out-of-stock product')
  else
    print console_interface.dispense_product
  end
end