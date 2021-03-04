require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @form_object = FactoryBot.build(:form_object, user_id: @user.id , item_id: @item.id)
    sleep 2
   end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '全ての値が正常に入力されていれば登録できること' do
        expect(@form_object).to be_valid
      end

      it "ビルが空の場合でも購入できる" do
        @form_object.building_name = ''
        expect(@form_object).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "post_codeが空だと登録できない" do
        @form_object.post_code = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Post code can't be blank")
      end

      it "prefecture_idが空だと登録できない" do
        @form_object.prefecture_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと登録できない" do
        @form_object.city = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空だと登録できない" do
        @form_object.address = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @form_object.phone_number = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number can't be blank")
      end

      it "post_codeにハイフンがないと登録できない" do
        @form_object.post_code = "1234567"
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Post code is invalid")
      end

      it "tokenが空では登録できないこと" do
        @form_object.token = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空の場合購入できない" do
        @form_object.user_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空の場合購入できない" do
        @form_object.item_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end

      it "prefecture_idのidに1が選択されている場合出品できない" do
        @form_object.prefecture_id = 1
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "phone_numberが12桁以上では登録できない" do
        @form_object.phone_number = '090-1234-5678'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが英数混合では登録できない" do
        @form_object.phone_number = 'abcdefghijk'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
