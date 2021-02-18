require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
      user = User.new(nickname: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "first_nameが空だと登録できない" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空だと登録できない" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空だと登録できない" do
      user = User.new(first_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空だと登録できない" do
      user = User.new(last_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "birthが空だと登録できない" do
      user = User.new(birth: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end

   
  end
end