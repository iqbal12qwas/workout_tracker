require "rails_helper"

RSpec.feature "Following friend" do
    
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password1")
        @jane = User.create(first_name: "Jane", last_name: "Foe", email: "jane@foe.com", password: "password2")
        
        login_as(@john)
    end
    
    scenario "if signed in, succeeds" do
        
        visit "/"
        
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@jane.full_name)
        expect(page).not_to have_link("Follow", :href => "/friendship?friend_id=#{@john.id}")
        
        link = "a[href='friendship?friend_id=#{@jane.id}']"
        find(link).click
        
        expect(page).not_to have_link("Follow", :href => "/friendship?friend_id=#{@jane.id}")
        
    end
end