class Company < ActiveRecord::Base
  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true

  def contacts
    return [] if self.id.nil? # new Company record
    contacts = Contact.where(company: self)
    contacts.empty? ? [] : contacts
  end  
end
