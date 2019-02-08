class CreateJoinUserConversation < ActiveRecord::Migration[5.2]
  def change
    create_table :join_user_conversations do |t|
    	t.belongs_to :user, index:true
    	t.belongs_to :conversation, index:true
    end
  end
end
