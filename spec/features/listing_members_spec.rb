require "rails_helper"

RSpec.feature "Listing Members" do
    
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password1")
        @jane = User.create(first_name: "Jane", last_name: "Foe", email: "jane@foe.com", password: "password2")
    end
    
    scenario do
        visit "/"
        expect(page).to have_content("List of Members")
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@jane.full_name)
        
    end
end