require 'spec_helper'

describe "estados/edit" do
  before(:each) do
    @estado = assign(:estado, stub_model(Estado,
      :nombre => "MyString"
    ))
  end

  it "renders the edit estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", estado_path(@estado), "post" do
      assert_select "input#estado_nombre[name=?]", "estado[nombre]"
    end
  end
end
