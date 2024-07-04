class Article < ApplicationRecord
    has_many :comments, dependent: :destroy #bu sayaede makale silindiği zaman makalenin yorumlarıda silinecek
    validates :title,  presence:true,
    length: {minimum: 2}
end
