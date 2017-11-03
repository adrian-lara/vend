require 'rails_helper'

describe Machine do

  describe "Instance Methods" do

    before(:each) do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @snack_1 = Snack.create(name: "drink_1", price: 1.00)
      @snack_2 = Snack.create(name: "drink_2", price: 2.00)
      @snack_3 = Snack.create(name: "drink_3", price: 1.50)
      MachineSnack.create(machine: @dons, snack: @snack_1)
      MachineSnack.create(machine: @dons, snack: @snack_2)
      MachineSnack.create(machine: @dons, snack: @snack_3)
    end

    describe "#average_snack_price" do
      it "returns the average price of all the snacks associated to a machine" do
        expect(@dons.average_snack_price).to eq(1.5)
      end
    end
  end

end
