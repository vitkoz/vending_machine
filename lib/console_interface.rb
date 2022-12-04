class ConsoleInterface

  def initialize(vending_machine)
    @vending_machine = vending_machine
  end

  def print_welcome_screen
    <<~TXT

      ===============================================================
      |                                                             |
      | Welcome to the Vending World of Pleasure                    |
      |                                                             |
      | Please review available products and make your selection    |
      |                                                             |
      ===============================================================

      #{menu_print_out}
      ---------------------------------------------------------------

    TXT
  end

  def menu_print_out
    menu = ''
    VendingMachine::PRODUCTS.each do |item|
      item_na = 'OUT OF STOCK ' unless @vending_machine.item_in_stock?(item[0])
      menu += "#{item_na}#{item[0]}: #{item[1][0]} @ $#{"%.2f" % item[1][1]}\n"
    end
    menu
  end

  def get_deposit
    print 'Please, insert money (any positive number): '
    @deposit = gets.to_f
    return @deposit
  end

  def get_selection
    print 'Make your selection: '
    @choice = gets.chomp.upcase
    return @choice
  end

  def dispense_product
    price = (VendingMachine::PRODUCTS.fetch(@choice, nil)&.last || 0)
    balance = @deposit - price
    res = ''

    if balance > 0
      change = @vending_machine.dispense_change(@deposit, price)
      if change.eql?('Not enough cash for change')
        return format_message(change)
      elsif !change.empty?
        res = "Your change is: #{change.to_s}"
      end
    elsif balance < 0
      return format_message('You did not deposit enough money to purchase this item', error = true)
    end

    <<~RES
        #{format_message(res)}
        ***************************************

        Enjoy your #{@vending_machine.purchase_order(@choice)}

        ***************************************

    RES
  end

  private

  def format_message(res, error = false)
    unless res.empty?
      if error
        error_msg = <<~ERR

        Please try again
        ERR
      end

      <<~RES

      ---------------------------------------

      #{res}
      #{error_msg}
      ---------------------------------------

      RES
    end
  end
end