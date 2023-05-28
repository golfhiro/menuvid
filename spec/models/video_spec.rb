require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'バリデーションテスト' do
    let(:video) { FactoryBot.create(:video) }

    fit "動画ID、タイトル、サムネイルがある場合、有効である" do
      video = FactoryBot.build(:video)
      expect(video).to be_valid
    end
  end
end
