require 'spec_helper'

describe "estados/new" do
  before(:each) do
    assign(:estado, stub_model(Estado,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", estados_path, "post" do
      assert_select "input#estado_nombre[name=?]", "estado[nombre]"
    end
  end
end
