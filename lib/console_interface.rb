class ConsoleInterface

  def initialize(vending_machine)
    @vending_machine = vending_machine
  end

  def print_welcome_screen
    <<~TXT
      Welcome to the Vending World of Pleasure

      Please review available products and make your selection

      #{menu_print_out}
    TXT
  end

  def menu_print_out
    menu = ''
    VendingMachine::PRODUCTS.each do |item|
      menu += "#{item[0]}: #{item[1][0]} @ $#{"%.2f" % item[1][1]}\n" if @vending_machine.item_in_stock?(item[0])
    end
    menu
  end

  # def print_out
  #   puts <<~END
  #     asdasd #{@vending_machine.products}
  #   END
  # end

  # def get_input
  #   print 'Make your selection: '
  #   choice = gets[0]
  #   return choice
  # end

end