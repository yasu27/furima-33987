require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    # インスタンスの生成
  end

  describe "ユーザー新規登録" do
    # ②以下の書き方をFactorybot用に書き換える
    # https://master.tech-camp.in/curriculums/4795
    # https://master.tech-camp.in/curriculums/4764

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      # user = User.new(nickname: nil)とおなじ書き方
      @user.valid?
      # trueかfalseで返ってくる
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      # user = User.new(email: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "birthが空だと登録できない" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'パスワードは、6文字以上の入力がないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは確認用と2回入力がないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが漢字・ひらがな・カタカナ以外だと登録できない' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが漢字・ひらがな・カタカナ以外だと登録できない' do
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_name_kanaがカタカナ以外だと登録できない' do
      @user.first_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaがカタカナ以外だと登録できない' do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "nicknameが登録できる" do
      @user.nickname = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "emailが登録できる" do
      @user.email = 'yamada@yamada.com'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "passwordが登録できる" do
      @user.password = '123abc'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "first_nameが登録できる" do
      @user.first_name = '山田'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "last_nameが登録できる" do
      @user.last_name = '太郎'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "first_name_kanaが登録できる" do
      @user.first_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

    it "last_name_kanaが登録できる" do
      @user.last_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages) 
    end

  end
end