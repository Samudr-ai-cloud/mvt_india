class Company < ApplicationRecord
  # ASSOCIATIONS
  has_many :company_details, inverse_of: :company, dependent: :restrict_with_exception
  validates :name, presence: true
  before_create :check_slug


  private

  def check_slug
    return if slug.present? || name.blank?

    name.parameterize.underscore
  end
end
