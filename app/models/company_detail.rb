class CompanyDetail < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :company, inverse_of: :company_details

  def self.top_company_details
    CompanyDetail.includes(:company).all.order(:popularity)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "company_id", "created_at", "description", "id", "id_value", "mobile_number", "popularity", "updated_at", "website"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company"]
  end

end
