require 'rails_helper'

RSpec.describe TilLog, type: :model do
  let(:user) { create(:user) }
  let(:til_log) { build(:til_log, user: user) }

  it 'has a valid factory' do
    expect(til_log).to be_valid
  end

  it { is_expected.to belong_to(:user) }

  context 'pg_search #search_for' do
    let!(:til_log1) { create(:til_log, user: user, title: 'tacos', body: 'foo') }
    let!(:til_log2) { create(:til_log, user: user, title: 'foo', body: 'bar') }

    it 'returns matching search in title' do
      expect(TilLog.search_for('tacos')).to contain_exactly(til_log1)
    end

    it 'returns matching search in title and body' do
      expect(TilLog.search_for('foo')).to contain_exactly(til_log1, til_log2)
    end

    it 'returns matches on partial match' do
      expect(TilLog.search_for('tac')).to contain_exactly(til_log1)
    end
  end
end
