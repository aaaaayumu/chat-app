require 'rails_helper'

RSpec.describe "チャットルーム削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると関連するメッセージが全て削除されている' do 
    # サインインする
    sign_in(@room_user.user)
    # 作成されたチャットルームに遷移する
    click_on @room_user.room.name
    # メッセージ情報を5つDBに保存する
    FactoryBot.create_list(:message, 5, user_id: @room_user.user.id, room_id: @room_user.room.id)
    # 「チャットを終了する」をクリックすることで、作成した５つのメッセージが削除されたことを確認する
    expect{
      click_on 'チャットを終了する'
    }.to change{ Message.count }.by(-5)
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end
