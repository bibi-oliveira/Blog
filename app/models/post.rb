class Post < ApplicationRecord
  belongs_to :user
                      # ao post ser deletado os comentários tbm irão
  has_many :comments, dependent: :destroy
end
