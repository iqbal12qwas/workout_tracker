require 'rails_helper'

RSpec.feature "Showing friends workouts" do
    
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password1")
        @jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@doe.com", password: "password1")
        login_as(@john)
        
        @e1 = @john.exercises.create(duration_in_min: 20, workout: "bodybuilding", workout_date: Date.today)
        @e2 = @john.exercises.create(duration_in_min: 100, workout: "running", workout_date: Date.today)
        
        @following = Friendship.create(user: @john, friend: @sarah)
    end
    
    scenario do
        
    end
end