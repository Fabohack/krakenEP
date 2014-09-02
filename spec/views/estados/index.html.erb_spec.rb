require 'spec_helper'

describe "estados/index" do
  before(:each) do
    assign(:estados, [
      stub_model(Estado,
        :nombre => "Nombre"
      ),
      stub_model(Estado,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of estados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
