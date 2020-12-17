require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      user.valid?
      binding.pry
    end
    it "emailが空だと登録できない" do
    end
    it "emailが重複していると登録できない" do
    end
    it "emailは@が含まれていないと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが6文字未満だと登録できない" do
    end
    it "passwordが半角英数字混合ではないと登録できない" do
    end
    it "password_confirmationが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameが全角の漢字ひらがなカタカナ以外だと登録できない" do
    end
    it "first_nameが全角の漢字ひらがなカタカナ以外だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaが全角カタカナ以外だと登録できない" do
    end
    it "first_name_kanaが全角カタカナ以外だと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
  end
end
