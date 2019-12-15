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

  scenario "商品を食事記録に追加する" do
    seven_eleven = create(:seven_eleven)
    item = create(:item, shop_ids: seven_eleven.id)

    #食事記録への商品追加
    click_on "商品を探す"
    click_on "詳細"
    expect{click_on "食事予定に追加"}.to change(ListItem, :count).by(1)
    expect(page).to have_content "食事予定リスト"
    click_on "食事記録に追加する"
    expect(current_path).to eq root_path
    expect(page).to have_content "食事記録を更新しました"

    #食事記録から商品削除
    click_on "食事記録を見る"
    click_on "削除"
    expect(current_path).to eq records_path
    expect(page).to have_content "食事記録から#{item.name}を削除しました"
  end

end
