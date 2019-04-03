require 'rails_helper'

RSpec.describe "til_logs/index", type: :view do
  before(:each) do
    assign(:til_logs, [
      TilLog.create!(
        :title => "Title",
        :body => "MyText",
        :public => false,
        :user => nil
      ),
      TilLog.create!(
        :title => "Title",
        :body => "MyText",
        :public => false,
        :user => nil
      )
    ])
  end

  it "renders a list of til_logs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
