require 'rails_helper'

describe Item do
  it "image,note以外が入力されていれば登録できる" do
    user = create(:user)
    shop = create(:shop)
    item = build(:item, image: nil, note: nil, user_id: user.id, shop_ids: shop.id)
    item.valid?
    expect(item).to be_valid
  end
  it "nameがないと無効となる" do
    item = build(:item, name: nil)
    item.valid?
    expect(item.errors[:name]).to include("を入力してください") 
  end
  it "priceがないと無効となる" do
    item = build(:item, price: nil)
    item.valid?
    expect(item.errors[:price]).to include("を入力してください") 
  end
  it "kcalがないと無効となる" do
    item = build(:item, kcal: nil)
    item.valid?
    expect(item.errors[:kcal]).to include("を入力してください") 
  end
  it "proteinがないと無効となる" do
    item = build(:item, protein: nil)
    item.valid?
    expect(item.errors[:protein]).to include("を入力してください") 
  end
  it "fatがないと無効となる" do
    item = build(:item, fat: nil)
    item.valid?
    expect(item.errors[:fat]).to include("を入力してください") 
  end
  it "carbがないと無効となる" do
    item = build(:item, carb: nil)
    item.valid?
    expect(item.errors[:carb]).to include("を入力してください") 
  end
  it "saltがないと無効となる" do
    item = build(:item, salt: nil)
    item.valid?
    expect(item.errors[:salt]).to include("を入力してください") 
  end
  it "shop_idがないと無効となる" do
    item = build(:item, shop_ids: nil)
    item.valid?
    expect(item.errors[:shops]).to include("を1つ以上選択してください") 
  end
end
