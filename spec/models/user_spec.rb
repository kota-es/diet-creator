require 'rails_helper'

describe User do
  describe '#create' do
    it "image以外が入力されていれば登録できる" do
      user = build(:user, image: nil)
      user.valid?
      expect(user).to be_valid
    end
  end
end