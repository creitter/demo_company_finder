class MainController < ApplicationController
  
  def index
    @results = []
  end
  
  def search
    company_name = params[:company_name]
    industry = params[:industry]
    
    @results = 
      if industry.present? 
        Company.where(industry: industry)
      elsif company_name.present?
        Company.where(name: company_name)
      else
        []
      end
      
    render :index
  end
   
end
