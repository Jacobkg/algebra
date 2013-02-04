require "spec_helper"

feature "Solving basic equations" do
  scenario "Solving a basic addition equation" do
    visit "/"

    fill_in "Equation", :with => "x + 5 = 7"
    click_button "Solve"

    page.should have_content "x+5=7"
    page.should have_content "-5"
    page.should have_content "x=2"
  end
end