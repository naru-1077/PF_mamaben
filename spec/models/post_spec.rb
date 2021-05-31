require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }
    subject { post.valid? }
    # let!(:other_post) { create(:post) }
    let(:post) { build(:post) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄でないこと' do
        post.introduction = ''
        is_expected.to eq false
      end
    end

    context 'materialカラム' do
      it '空欄でないこと' do
        post.material = ''
        is_expected.to eq false
      end
    end

  context 'iamge_idカラム' do
      it '空欄でないこと' do
        post.image_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Post_Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Recipeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:recipes).macro).to eq :has_many
      end
    end
  end
end