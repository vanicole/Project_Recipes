class Recipe < ApplicationRecord

    validates :user_id, presence: true
    validates :title, presence: true
    validates :category, presence: true
    validates :ingredients, presence: true
    validates :steps, presence: true, length: {minimum: 5}
    validates :dosage, presence: true
    validates :preparation, presence: true

    validates_inclusion_of :category, :in => ['Primo piatto', 'Secondo piatto', 'Antipasto', 'Contorno', 'Dolce']
    
    has_many :reviews, dependent: :destroy
    belongs_to :user 

    # Utenti attuali che preferiscono una ricetta
    has_many :favorite_recipes, dependent: :destroy
    has_many :favorited_by, through: :favorite_recipes, source: :user, dependent: :destroy

    has_one :video, dependent: :destroy
    # Mount img
    mount_uploader :image, ImageUploader, dependent: :destroy
    
    def averageScore
        total = 0
        self.reviews.each do |r|
            total += r.vote
        end
        return (total.to_f/self.reviews.count.to_f).round(2)
    end

end
