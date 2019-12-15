require 'rails_helper'

describe Review do
  it "comment, taste, volumeが入力してあれば登録できる" do
    user = create(:user)
    shop = create(:seven_eleven)
    item = create(:item, shop_ids: shop.id)
    review = build(:review, user_id: user.id, item_id: item.id)
    review.valid?
    expect(review).to be_valid
  end
  it "commentがないと無効となる" do
    review = build(:review, comment: nil)
    review.valid?
    expect(review.errors[:comment]).to include("を入力してください") 
  end  
end
