require 'rails_helper'

describe Item do
  describe '#create' do
    it "image,note以外が入力されていれば登録できる" do
      user = create(:user)
      item = build(:item, image: nil, note: nil, user_id: user.id)
      item.valid?
      expect(item).to be_valid
    end
  end
end
