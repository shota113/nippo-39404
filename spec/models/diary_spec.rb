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
      it 'categoryが空だと投稿できない' do
        @diary.category = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Category can't be blank")
      end
      it 'workが空だと投稿できない' do
        @diary.work = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Work can't be blank")
      end
      it 'start_timeが空だと投稿できない' do
        @diary.start_time = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("start_time can't be blank")
      end
      it 'ending_timeが空だと投稿できない' do
        @diary.ending_time = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("ending_time can't be blank")
      end
      it 'categoryが「---」だと出品できない' do
        @diary.category_id = 1
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end