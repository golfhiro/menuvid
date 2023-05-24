require "rails_helper"

RSpec.describe User, type: :model do
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
end
