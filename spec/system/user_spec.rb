# require 'rails_helper'

# RSpec.describe 'Users', type: :system do
#   let(:user) { create(:user) }

#   describe 'ログイン前' do
#     describe 'ユーザー新規登録' do
#       context 'フォームの入力値が正常' do
#         it 'ユーザーの新規作成が成功する' do
#           visit new_user_path
#           fill_in 'Email', with: 'email@example.com'
#           fill_in 'Password', with: 'password'
#           fill_in 'Password confirmation', with: 'password'
#           click_button 'SignUp'
#           expect(page).to have_content 'User was successfully created.'
#           expect(current_path).to eq login_path
#         end
#       end
#     end
#   end
# end
