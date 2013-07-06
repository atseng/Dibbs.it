module CreateItemHelper

  def create_item(item)
    visit new_item_path(user)
    fill_in "Name", with: item.name
    select(item.activity, :from => "Activity")
    select(item.category, :from => "Category")
    fill_in "Description", with: item.description
    fill_in "Value", with: item.value
    click_button "Add Item"

    expect(page).to have_content("Item created")
  end

end
