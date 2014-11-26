class Company < ActiveRecord::Base
  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true

  def contacts
    Contact.where(company: self)
  end
  
end
