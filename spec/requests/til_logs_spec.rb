require 'rails_helper'

RSpec.describe "TilLogs", type: :request do
  describe "GET /til_logs" do
    it "works! (now write some real specs)" do
      get til_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
