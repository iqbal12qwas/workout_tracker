require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @owner = User.create(first_name: "John", last_name: "Doe", email: "owner@example.com", password: "password")
    
    @owner_exer = @owner.exercises.create!(duration_in_min: 48, workout: "Cardio special", workout_date: Date.today)
    
    login_as(@owner)
  end
  
  scenario do
    visit "/"
    click_link "My Lounge"
    
    
    expect(page).to have_content(@owner_exer.duration_in_min)
    expect(page).to have_content(@owner_exer.workout)
    expect(page).to have_content(@owner_exer.workout_date)
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click
    
    expect(page).to have_content("Exercise has been deleted")
    
    
    expect(page).not_to have_content(@owner_exer.duration_in_min)
    expect(page).not_to have_content(@owner_exer.workout)
    expect(page).not_to have_content(@owner_exer.workout_date)
  end
end