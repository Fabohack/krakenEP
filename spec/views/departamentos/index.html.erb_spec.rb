require 'spec_helper'

describe "departamentos/index" do
  before(:each) do
    assign(:departamentos, [
      stub_model(Departamento,
        :nombre => "Nombre"
      ),
      stub_model(Departamento,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of departamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
