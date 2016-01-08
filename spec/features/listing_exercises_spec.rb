require 'rails_helper'

RSpec.feature "Listing exercises" do
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password1")
        @jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@doe.com", password: "password1")
        login_as(@john)
        
        @e1 = @john.exercises.create(duration_in_min: 20, workout: "bodybuilding", workout_date: Date.today)
        @e2 = @john.exercises.create(duration_in_min: 100, workout: "running", workout_date: Date.today)
        
        @following = Friendship.create(user: @john, friend: @sarah)
    end
    
    scenario "Shows user's workouts for last 7 days" do
        visit "/"
        
        click_link "My Lounge"
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
    end
    
    scenario "shows list of user's friends" do
        visit "/"
        
        click_link "My Lounge"
        expect(page).to have_content("My Friends")
        expect(page).to have_link(@jane.full_name)
        expect(page).to have_link("Unfollow")
    end
end