require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it 'nicknameが存在すれば登録できる' do
        @user.nickname = "aaa"
        expect(@user).to be_valid
      end
    end

      it 'メールアドレスが存在すれば登録出来る' do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上、英字と数字の両方を含めてあれば登録できる' do
        @user.password = "000aaa"
        expect(@user).to be_valid
      end
      
      it 'パスワード(確認)で同じパスワードが入力されれば登録出来る'do
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end

      it '名前(last_name)が全角で入力されていれば登録できる'do
      @user.last_name = "山田"
      expect(@user).to be_valid
      end

      it '名前(first_name)が全角で入力されていれば登録できる'do
      @user.last_name = "太郎"
      expect(@user).to be_valid
      end

      it '名前(last_name_kana)が全角カナで入力されていれば登録できる'do
      @user.last_name = "ヤマダ"
      expect(@user).to be_valid
      end
      
      it '名前(first_name_kana)が全角カナで入力されていれば登録できる'do
      @user.first_name = "タロウ"
      expect(@user).to be_valid
      end

      it '生年月日が入力されていれば登録できる'do
      @user.birth_date = "1931-01-01"
      expect(@user).to be_valid
      end
    end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'passwordは英数字混合でないと登録できない' do
      @user.password = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'emailが同じでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaが全角カナでなければ登録できない' do
      @user.last_name_kana = 'ｵｵｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが全角カナでなければ登録できない' do
      @user.first_name_kana = 'ｵｵｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'last_name_kanaがカタカナ以外の全角文字だと登録できないこと' do
      @user.last_name_kana = 'おおお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaがカタカナ以外の全角文字だと登録できないこと' do
      @user.first_name_kana = 'おおお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'emailで「＠」がない場合、登録できない' do
      @user.email = 'aaacom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '123123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'abcabc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが全角の場合は登録できない' do
      @user.password = 'おおお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   end
  end
end
