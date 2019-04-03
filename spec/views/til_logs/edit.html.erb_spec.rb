require 'rails_helper'

RSpec.describe "til_logs/edit", type: :view do
  before(:each) do
    @til_log = assign(:til_log, TilLog.create!(
      :title => "MyString",
      :body => "MyText",
      :public => false,
      :user => nil
    ))
  end

  it "renders the edit til_log form" do
    render

    assert_select "form[action=?][method=?]", til_log_path(@til_log), "post" do

      assert_select "input[name=?]", "til_log[title]"

      assert_select "textarea[name=?]", "til_log[body]"

      assert_select "input[name=?]", "til_log[public]"

      assert_select "input[name=?]", "til_log[user_id]"
    end
  end
end
