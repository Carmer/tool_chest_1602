require "rails_helper"

RSpec.feature "Editing Tools" do
  scenario "user can edit a tool" do
    tool = Tool.create(name: "Tool Name", price: 10 , quantity: 20 )

    visit tool_path(tool)

    click_button "Delete"

    assert tools_path, current_path

    assert_equal 0, Tool.count
    refute page.has_content?("Tool Name")
  end
end
