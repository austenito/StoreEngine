require 'spec_helper'

describe "indices/index" do
  before(:each) do
    assign(:indices, [
      stub_model(Index),
      stub_model(Index)
    ])
  end

  it "renders a list of indices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
