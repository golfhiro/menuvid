require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path
        fill_in '名前', with: 'user_1'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'パスワード'
        fill_in 'パスワード（確認）', with: 'パスワード'
        click_button '新規登録'
        expect(current_path).to eq users_path
      end
    end

    context '名前が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'パスワード'
        fill_in 'パスワード（確認）', with: 'パスワード'
        click_button '新規登録'
        expect(page).to have_content '名前名前を入力してください。'
        expect(page).to have_content "ユーザー登録に失敗しました"
        expect(current_path).to eq users_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'hiroki'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'パスワード'
        fill_in 'パスワード（確認）', with: 'パスワード'
        click_button '新規登録'
        expect(page).to have_content 'メールアドレスメールアドレスを入力してください。'
        expect(page).to have_content "ユーザー登録に失敗しました"
        expect(current_path).to eq users_path
      end
    end

    context '登録済のメールアドレスを使用' do
      fit 'ユーザーの新規作成が失敗する' do
        existed_user = FactoryBot.create(:user)
        visit new_user_path
        fill_in '名前', with: 'user_1'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'パスワード'
        fill_in 'パスワード（確認）', with: 'パスワード'
        click_button '新規登録'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(current_path).to eq users_path
        expect(page).to have_field 'メールアドレス', with: existed_user.email
      end
    end
  end
end
