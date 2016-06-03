require "rails_helper"

RSpec.feature "Editing Tools" do
  scenario "user can edit a tool" do
    tool = Tool.create(name: "Tool", price: 10 , quantity: 20 )

    visit edit_tool_path(tool)

    fill_in "tool[name]", with: "Updated Tool"
    fill_in "tool[price]", with: "11"
    fill_in "tool[quantity]", with: "21"
    click_button "Update Tool"

    assert tool_path(tool), current_path

    within(".tool_info li:nth-child(1)") do
      expect(page).to have_content("Updated Tool")
    end

    within(".tool_info li:nth-child(2)") do
      expect(page).to have_content("$11.0")
    end

    within(".tool_info li:nth-child(3)") do
      expect(page).to have_content("InStock: 21")
    end
  end
end
