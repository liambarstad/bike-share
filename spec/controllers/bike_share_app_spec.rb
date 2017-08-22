describe "Station CRUD" do

end

describe "Trip CRUD" do

end

describe "Weather CRUD" do
  it "has main page" do
    visit('/condtitions')

    is_expected.to respond_with 200
    is_expected.to have_content "..."
  end

  it "can show new page" do
    visit('/conditions')
    click_button('new')

    is_expected.to respond_with 200
    is expected.to have_content "..."
  end

  it "can show single weather" do
    visit('/conditions/5')

    is_expected.to respond_with 200
    is_expected.to have_content "..."
  end


  it "can post new weather" do

  end

  it "can show edit page" do

  end

  it "can edit" do

  end

  it "can delete entry" do

  end
end
