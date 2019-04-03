require 'rails_helper'

RSpec.describe "til_logs/new", type: :view do
  before(:each) do
    assign(:til_log, TilLog.new(
      :title => "MyString",
      :body => "MyText",
      :public => false,
      :user => nil
    ))
  end

  it "renders new til_log form" do
    render

    assert_select "form[action=?][method=?]", til_logs_path, "post" do

      assert_select "input[name=?]", "til_log[title]"

      assert_select "textarea[name=?]", "til_log[body]"

      assert_select "input[name=?]", "til_log[public]"

      assert_select "input[name=?]", "til_log[user_id]"
    end
  end
end
