require 'rails_helper'

RSpec.describe 'Post_Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_comment.valid? }

    # let!(:other_post_comment) { create(:post_comment) }
    let(:post_comment) { build(:post_comment) }

    context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        is_expected.to eq false
      end
      it '80文字以下であること: 80文字は〇' do
        post_comment.comment = Faker::Lorem.characters(number: 80)
        is_expected.to eq true
      end
      it '80文字以下であること: 81文字は×' do
        post_comment.comment = Faker::Lorem.characters(number: 81)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end