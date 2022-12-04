class VendingMachine

  PRODUCTS = {
    'C1' => ['Coca Cola', 1.25],
    'P3' => ['Pepsi', 1.25],
    'S3' => ['Sprite', 1.50],
    'B7' => ['Bamba', 2],
  }

  def initialize
    @quantities = load_init_inventory
    @cash_on_hand = load_cash_register
  end

  def purchase_order(customer_choice)
    prod = PRODUCTS.fetch(customer_choice, nil)
    return 'Invalid product selection' if prod.nil?

    @quantities[customer_choice] -= 1
    return prod[0] unless prod.nil?
  end

  def item_in_stock?(item_code)
    return false if @quantities[item_code].nil?

    @quantities[item_code] > 0
  end

  def has_no_inventory?
    @quantities.values.sum == 0
  end

  def total_cash_on_hand
    @cash_on_hand.sum{|el| el[0].to_f * el[1]}
  end

  def invalid_selection?(item_code)
    @quantities.fetch(item_code, nil).nil?
  end

  def out_of_stock?(item_code)
    @quantities.fetch(item_code, nil) < 1
  end

  def dispense_change(deposit, price)
    change = deposit - price
    return 'Not enough cash for change' if total_cash_on_hand < change

    msg = []

    [5, 3, 2, 1, 0.5, 0.25].each do |coin|
      next if @cash_on_hand[coin.to_s] == 0

      quant, change = change.divmod(coin)
      quant, change = check_cash_on_hand(coin, quant, change)

      msg << (quant.zero? ? nil : "$#{"%.2f" % coin} * #{quant}")
    end

    return 'Not enough cash for change' if change > 0

    msg.compact.join(', ')
  end

  private

  def check_cash_on_hand(coin, quant, change)
    if @cash_on_hand[coin.to_s] < quant
      coins_not_on_hand = quant - @cash_on_hand[coin.to_s]
      change += coin * coins_not_on_hand
      quant -= coins_not_on_hand
      @cash_on_hand[coin.to_s] = 0
      [quant, change]
    else
      @cash_on_hand[coin.to_s] -= quant
      [quant, change]
    end
  end

  def load_init_inventory
    { 'C1' => 3, 'P3' => 5, 'S3' => 1, 'B7' => 2 }
  end

  def load_cash_register
    { '0.25' => 3, '0.5' => 5, '1' => 1, '2' => 2, '3' => 5, '5' => 1 }
  end
end