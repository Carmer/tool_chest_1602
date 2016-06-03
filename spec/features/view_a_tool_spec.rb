require "rails_helper"

RSpec.feature "View Tools" do
  scenario "user can view a single tool" do
    tool = Tool.create(name: "Tool", price: 10 , quantity: 20 )

    visit tool_path(tool)

    within(".tool_info li:nth-child(1)") do
      expect(page).to have_content("Tool")
    end

    within(".tool_info li:nth-child(2)") do
      expect(page).to have_content("$10.0")
    end

    within(".tool_info li:nth-child(3)") do
      expect(page).to have_content("InStock: 20")
    end
  end
end
