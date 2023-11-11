require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日報の投稿登録' do
    context '投稿できるとき' do
      it 'diary,user,place,work,start_time,ending_time,category_idが入力されている場合は出品できる' do
        expect(@diary).to be_valid
      end
    end
    context '投稿ができないとき' do
      it 'ユーザー登録している人じゃないと投稿できない' do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("User must exist")
      end
      it 'placeが空だと投稿できない' do
        @diary.place = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Place can't be blank")
      end
    end
  end
end