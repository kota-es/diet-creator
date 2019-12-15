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

  scenario "レビューの投稿・編集・削除" do
    seven_eleven = create(:seven_eleven)
    item = create(:item, name: "おにぎり", shop_ids: seven_eleven.id)

    #レビューの投稿
    click_on "商品を探す"
    expect(page).to have_content "登録商品リスト"
    click_on "詳細"
    click_on "レビューを投稿"
    expect(current_path).to eq new_item_review_path(item)
    expect{
      select 3, from: "美味しさ（５段階評価）"
      select 3, from: "満腹感（５段階評価）"
      fill_in "コメント", with: "美味しいです"
      click_on "登録する"
    }.to change(Review, :count).by(1)
    expect(current_path).to eq item_path(item)
    expect(page).to have_content "レビューを投稿しました"

    #レビューの編集
    click_on "編集"
    expect(page).to have_content "#{item.name} のレビュー編集"
    select 4, from: "美味しさ（５段階評価）"
    select 4, from: "満腹感（５段階評価）"
    fill_in "コメント", with: "美味しいです!!!"
    click_on "更新する"
    expect(current_path).to eq item_path(item)
    expect(page).to have_content "レビューを更新しました"

    #レビューの削除
    click_on "削除"
    expect(current_path).to eq item_path(item)
    expect(page).to have_content "レビューを削除しました"
  end

end