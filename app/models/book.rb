class Book < ApplicationRecord
    belongs_to :user , optional: true

    validates :user_id, presence: true
    validates :name, presence: true, length: {maximum: 50}
    validates :introduction, presence: true, length: {maximum: 200}

    mount_uploader :image 
end
