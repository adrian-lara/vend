require 'rails_helper'

describe Snack do

  describe "Instance Methods" do

    before(:each) do
      @owner_1 = Owner.create(name: "Sam's Snacks")
      @machine_1  = @owner_1.machines.create(location: "Don's Mixed Drinks")
      @machine_2  = @owner_1.machines.create(location: "Best Snacks")
      @snack_1 = Snack.create(name: "drink_1", price: 1.00)
      @snack_2 = Snack.create(name: "drink_2", price: 2.00)
      @snack_3 = Snack.create(name: "drink_3", price: 1.50)
      MachineSnack.create(machine: @machine_1, snack: @snack_1)
      MachineSnack.create(machine: @machine_2, snack: @snack_1)
      MachineSnack.create(machine: @machine_2, snack: @snack_2)
      MachineSnack.create(machine: @machine_1, snack: @snack_3)
    end

    describe "#locations" do
      it "returns an array of locations" do
        expect(@snack_1.locations).to eq([@machine_1.location, @machine_2.location])
      end
    end

  end

end
