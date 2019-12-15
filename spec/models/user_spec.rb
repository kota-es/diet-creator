require 'rails_helper'

describe User, type: :model do
  it "image以外が入力されていれば登録できる" do
    user = build(:user, image: nil)
    user.valid?
    expect(user).to be_valid
  end
  it "nameがないと無効となる" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  it "emailがないと無効となる" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  it "emailが重複すると無効となる" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end
  it "passwordがないと無効となる" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
  it "passwordが6文字以下だと無効となる" do
    user = build(:user, password: "1q2w3e")
    user.valid?
    expect(user.errors[:password]).to include("は7文字以上で入力してください")
  end
  it "passwordが英字のみだと無効となる" do
    user = build(:user, password: "abcdefg")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end
  it "passwordが数字のみだと無効となる" do
    user = build(:user, password: "1234567")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end
  it "password_confirmationがpasswordと一致していないと無効となる" do
    user = build(:user, password_confirmation: "4e3w2q1")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
  end
  it "genderがないと無効となる" do
    user = build(:user, gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("を入力してください")
  end
  it "heightがないと無効となる" do
    user = build(:user, height: nil)
    user.valid?
    expect(user.errors[:height]).to include("を入力してください")
  end
  it "weightがないと無効となる" do
    user = build(:user, weight: nil)
    user.valid?
    expect(user.errors[:weight]).to include("を入力してください")
  end
  it "palがないと無効となる" do
    user = build(:user, pal: nil)
    user.valid?
    expect(user.errors[:pal]).to include("を入力してください")
  end
  it "birthdayがないと無効となる" do
    user = build(:user, birthday: nil)
    user.valid?
    expect(user.errors[:birthday]).to include("を入力してください")
  end
end