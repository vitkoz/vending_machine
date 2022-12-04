class VendingMachine

  PRODUCTS = {
    'C1' => ['Coca Cola', 1.25],
    'P3' => ['Pepsi', 1.25],
    'S3' => ['Sprite', 1.50],
    'B7' => ['Bamba', 2],
  }

  def initialize
    @quantities = load_init_inventory
  end

  def dispense_product(customer_choice)
    "Enjoy your #{purchase_order(customer_choice)}"
  end

  def purchase_order(customer_choice)
    prod = PRODUCTS.fetch(customer_choice, nil)

    return prod[0] unless prod.nil?
  end

  def item_in_stock?(item)
    return false if @quantities[item].nil?

    @quantities[item] > 0
  end

  def has_inventory?
    @quantities.values.sum
  end

  private

  def load_init_inventory
    { 'C1' => 3, 'P3' => 5, 'S3' => 1, 'B7' => 2 }
  end
end