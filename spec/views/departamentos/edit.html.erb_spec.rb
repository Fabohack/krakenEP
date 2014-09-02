require 'spec_helper'

describe "departamentos/edit" do
  before(:each) do
    @departamento = assign(:departamento, stub_model(Departamento,
      :nombre => "MyString"
    ))
  end

  it "renders the edit departamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", departamento_path(@departamento), "post" do
      assert_select "input#departamento_nombre[name=?]", "departamento[nombre]"
    end
  end
end
