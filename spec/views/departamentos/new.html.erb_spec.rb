require 'spec_helper'

describe "departamentos/new" do
  before(:each) do
    assign(:departamento, stub_model(Departamento,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new departamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", departamentos_path, "post" do
      assert_select "input#departamento_nombre[name=?]", "departamento[nombre]"
    end
  end
end
