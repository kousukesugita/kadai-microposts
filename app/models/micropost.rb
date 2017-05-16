class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :users, through: :favorites

  # 一般的に末尾に ? が付くメソッドは boolean ( true / false ) を返却する
  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end
end