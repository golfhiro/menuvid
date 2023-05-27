require "rails_helper"

RSpec.describe User, type: :model do
  describe 'ユーザー作成関連' do
    it "ユーザー作成" do
      @user = FactoryBot.create(:user)
      expect(@user).to be_valid
    end

    it "名前・メール・パスワードがあれば有効な状態であること" do
      user = User.new(
        name: "hiroki",
        email: "hiroki@example.com",
        password: "password",
        password_confirmation: "password",
      )
      expect(user).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      user = User.new(
        name: nil,
        email: "hiroki@example.com",
        password: "passwod",
        password_confirmation: "password",
      )
      user.valid?
      expect(user).not_to be_valid
    end

    it "重複したメールアドレスなら無効となること" do
      User.create(
        name: "hiroki",
        email: "hiroki@example.com",
        password: "passwod",
        password_confirmation: "password",
      )

      user = User.new(
        name: "tome",
        email: "hiroki@example.com",
        password: "passwod",
        password_confirmation: "password",
      )
      user.valid?
      expect(user).not_to be_valid
    end

    it "パスワードがなければ無効な状態であること" do
      user = User.new(
        name: nil,
        email: "hiroki@example.com",
        password: "",
        password_confirmation: "",
      )
      user.valid?
      expect(user).not_to be_valid
    end

    it "パスワードと確認用パスワード不一致の場合には無効な状態であること" do
      user = User.new(
        name: nil,
        email: "hiroki@example.com",
        password: "password",
        password_confirmation: "passwordpassword",
      )
      user.valid?
      expect(user).not_to be_valid
    end
  end

  describe '献立の作成ができる' do
    it 'ユーザーが1週間の献立を作成できること' do
      menus = FactoryBot.create_list(:menu, 7)

      expect(menus.length).to eq(7)  # 7つの献立が作成されたことを確認

      menus.each_with_index do |menu, index|
        expect(menu.user).to be_an_instance_of(User)  # ユーザーオブジェクトと関連付けられていることを確認
        expect(menu.dish).to be_an_instance_of(Dish)  # 料理オブジェクトと関連付けられていることを確認
      end
    end
  end
end
