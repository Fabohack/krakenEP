require 'spec_helper'

describe "departamentos/show" do
  before(:each) do
    @departamento = assign(:departamento, stub_model(Departamento,
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
  end
end
