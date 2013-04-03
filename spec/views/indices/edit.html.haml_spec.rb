require 'spec_helper'

describe "indices/edit" do
  before(:each) do
    @index = assign(:index, stub_model(Index))
  end

  it "renders the edit index form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", index_path(@index), "post" do
    end
  end
end
