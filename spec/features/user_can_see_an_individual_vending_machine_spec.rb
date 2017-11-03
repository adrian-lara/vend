require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location and a list of snacks of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: "drink_1", price: 1.00)
    snack_2 = Snack.create(name: "drink_2", price: 2.00)
    snack_3 = Snack.create(name: "drink_3", price: 1.50)
    MachineSnack.create(machine: dons, snack: snack_1)
    MachineSnack.create(machine: dons, snack: snack_2)
    MachineSnack.create(machine: dons, snack: snack_3)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("drink_1: $1.0")
    expect(page).to have_content("drink_2: $2.0")
    expect(page).to have_content("drink_3: $1.5")
  end
end
