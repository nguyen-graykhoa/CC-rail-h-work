class Post < ApplicationRecord
    belongs_to :user

    has_many :comments, dependennt: :destroy
end
