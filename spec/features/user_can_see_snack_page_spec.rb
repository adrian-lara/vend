require 'rails_helper'

describe "When a user visits a snack show page" do
  before(:each) do
    @owner_1 = Owner.create(name: "Sam's Snacks")
    @machine_1  = @owner_1.machines.create(location: "Don's Mixed Drinks")
    @machine_2  = @owner_1.machines.create(location: "Best Snacks")
    @snack_1 = Snack.create(name: "drink_1", price: 1.00)
    @snack_2 = Snack.create(name: "drink_2", price: 2.00)
    @snack_3 = Snack.create(name: "drink_3", price: 1.50)
    MachineSnack.create(machine: @machine_1, snack: @snack_1)
    MachineSnack.create(machine: @machine_2, snack: @snack_2)
    MachineSnack.create(machine: @machine_1, snack: @snack_3)
  end

  it "the user can see snack name, price, and locations" do
    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content("Price: #{@snack_1.name}")
    expect(page).to have_content("Locations: #{@machine_1.location}, #{@machine_2.location}")
  end
end
