require 'rails_helper'

RSpec.feature "Users", type: :feature do
    let(:pass){"1q2w3e4"}
    let(:user){create(:user)}
    

    scenario "ユーザーを新規登録する" do
      visit root_path
      expect(current_path).to eq "/sessions/new"
      click_on "新規登録はこちら"
      fill_in "お名前（ニックネーム）", with: "tester"
      fill_in "メールアドレス", with: "spec@test.com"
      fill_in "パスワード", with: pass
      fill_in "パスワード(確認)", with: pass
      click_on "次に進む"
      expect(current_path).to eq profile_registration_users_path
      expect(page).to have_content "プロフィール登録"
      expect{
        attach_file "アバター画像", "spec/fixtures/spec_test.png"
        choose "男性"
        fill_in "身長", with: 170.0
        fill_in "体重", with: 60.5
        choose "[1.75]座位中心の仕事だが、通勤・趣味・家事など軽い運動習慣がある"
        select 1980, from: "user_birthday_1i"
        select 10, from: "user_birthday_2i"
        select 20, from: "user_birthday_3i"
        click_on "登録する"
      }.to change(User, :count).by(1).and change(Record, :count).by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content "ユーザー登録が完了しました"
    end

    scenario "ユーザーがサインインする" do
      visit root_path
      expect(current_path).to eq "/sessions/new"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: pass
      click_on "ログイン"
      expect(current_path).to eq root_path
      expect(user.record).to be_truthy
      expect(page).to have_content "ログインしました"
    end
end
