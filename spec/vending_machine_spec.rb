require 'vending_machine'

describe VendingMachine do
  before :each do
    @vend = VendingMachine.new
  end

  it 'returns nil for invalid code' do
    expect(@vend.purchase_order('WRONGCODE')).to eq 'Invalid product selection'
  end

  it 'returns correct product' do
    prod = VendingMachine::PRODUCTS.first
    expect(@vend.purchase_order(prod[0])).to eq VendingMachine::PRODUCTS.fetch(prod[0]).first
  end

  it 'dispenses correct and optimized change' do
    expect(@vend.dispense_change(12, 1.25)).to eq '$5.00 * 1, $3.00 * 1, $2.00 * 1, $0.50 * 1, $0.25 * 1'
    expect(@vend.dispense_change(137, 1.25)).to eq 'Not enough cash for change'
  end
end
