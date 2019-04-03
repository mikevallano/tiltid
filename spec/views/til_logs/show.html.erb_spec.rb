require 'rails_helper'

RSpec.describe "til_logs/show", type: :view do
  before(:each) do
    @til_log = assign(:til_log, TilLog.create!(
      :title => "Title",
      :body => "MyText",
      :public => false,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
