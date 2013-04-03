require 'spec_helper'

describe "indices/show" do
  before(:each) do
    @index = assign(:index, stub_model(Index))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
