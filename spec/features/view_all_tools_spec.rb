require "rails_helper"

RSpec.feature "View all Tools" do
  scenario "user can view all tools" do
    2.times do |n|
      Tool.create(name: "Tool#{n}", price: 10 + n, quantity: 20 + n )
    end

    visit tools_path

    within(".tool_info li:nth-child(1)") do
      expect(page).to have_content("Tool0 - $10.0 - only 20 left!")
    end

    within(".tool_info li:nth-child(2)") do
      expect(page).to have_content("Tool1 - $11.0 - only 21 left!")
    end
  end
end
