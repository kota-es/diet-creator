require 'rails_helper'

RSpec.feature "Items", type: :feature do
   
  let(:user){create(:user)}

  background do
    visit root_path
    expect(current_path).to eq "/sessions/new"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "1q2w3e4"
    click_on "ログイン"
  end

  scenario "商品を登録する" do
    create(:seven_eleven)
    
    click_on "商品を登録する"
    expect(current_path).to eq "/items/new"
    expect{
      fill_in "商品名", with: "おにぎり"
      attach_file "商品画像", "spec/fixtures/spec_test.png"
      select "おにぎり", from: "商品ジャンル"
      check "セブン-イレブン"
      fill_in "価格（税抜）", with: 120
      fill_in "カロリー", with: 200
      fill_in "タンパク質", with: 5.5
      fill_in "脂質", with: 10.2
      fill_in "炭水化物", with: 50
      fill_in "食塩相当量", with: 1 
      fill_in "備考", with: "塩だけのおむすび"
      click_on "登録する"
    }.to change(Item, :count).by(1)
    expect(current_path).to eq items_path
    item = Item.first
    expect(page).to have_content "商品「#{item.name}」の登録が完了しました"
  end

  scenario "商品を編集する" do
    seven_eleven = create(:seven_eleven)
    item = create(:item, name: "おにぎり", shop_ids: seven_eleven.id)

    click_on "商品を探す"
    expect(current_path).to eq items_path
    expect(page).to have_content "登録商品リスト"
    click_on "詳細"
    expect(current_path).to eq item_path(item)
    click_on "商品情報を編集"
    expect(current_path).to eq edit_item_path(item)
    expect(page).to have_content "商品編集"
    fill_in "商品名", with: "焼きおにぎり"
    click_on "更新する"
    expect(current_path).to eq items_path
    expect(page).to have_content "商品「焼きおにぎり」の更新が完了しました"
  end

end
