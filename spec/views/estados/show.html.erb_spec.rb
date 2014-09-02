require 'spec_helper'

describe "estados/show" do
  before(:each) do
    @estado = assign(:estado, stub_model(Estado,
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
  end
end
