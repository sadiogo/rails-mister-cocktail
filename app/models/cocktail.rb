class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, before_remove: :cocktail_independent_of?
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true

  private

  def cocktail_independent_of?(ingredient)
    verification = true
    unless ingredient.cocktails.nil?
      self.errors[:deletion_status] = 'Cannot delete an ingredient present in active cocktails'
      verification = false
    end
    verification
  end
end
