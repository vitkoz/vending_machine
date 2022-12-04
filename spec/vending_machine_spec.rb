require 'vending_machine'

describe VendingMachine do
  before :all do
    @vend = VendingMachine.new
  end

  it 'returns nil for invalid code' do
    expect(@vend.purchase_order('WRONGCODE')).to be_nil
  end

  it 'returns correct product' do
    prod = VendingMachine::PRODUCTS.first
    expect(@vend.purchase_order(prod[0])).to eq VendingMachine::PRODUCTS.fetch(prod[0]).first
  end
end
