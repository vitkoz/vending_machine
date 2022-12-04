# The vending machine, once a product is selected and the appropriate amount of money (coins) is inserted, should return that product.
# It should also return change (coins) if too much money is provided
# or ask for more money (coins) if there is not enough
# Change should be printed as coin * count and as minimum coins as possible.
# An item is out of stock
# The machine does not have enough change to return to the customer.

# Available coins: 0.25, 0.5, 1, 2, 3, 5 (edited)

require_relative 'lib/console_interface'
require_relative 'lib/vending_machine'

vending_machine = VendingMachine.new
console_interface = ConsoleInterface.new(vending_machine)

if vending_machine.has_inventory?

  # 1. get money

  # 2. get selection
  # - if out of stock - warn and ask for new selection
  # - if not enough money for change - warn and ask to deposit less

  # 3. dispense_product

  # 4. display welcome screen

  print console_interface.print_welcome_screen
  deposit = console_interface.get_deposit

  # product_selection = console_interface.get_selection

  # if console_interface.enough_money(deposit, product_selection)

  # p vending_machine.dispense_product(customer_choice)

end