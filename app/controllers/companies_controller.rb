class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :add_contact]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    create_contacts
    
    respond_to do |format|
      
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      
      create_contacts
      
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :size, :year, :industry, :revenue)
    end
    
    def contact_params
      params.require(:company).permit(contact_attributes: [:name, :email, :phone])
    end
    
    def create_contacts
      # Update contact info
      if params[:company][:contacts_attributes].present?
        params[:company][:contacts_attributes].each { |index, contact|
          @contact = Contact.find_by_id(contact[:id])
        
          if @contact.present?
            @contact.update_attributes!(name: contact[:name], email: contact[:email], phone: contact[:phone])
          else
            @contact = Contact.create!(name: contact[:name], email: contact[:email], phone: contact[:phone], company: @company)
          end
        }
      end
      
      # Check if the user had a contact they hadn't "officially" added to the list (but they probably want it there)
      if params[:company][:contact][:name].present?
        @contact = Contact.create!(name: params[:company][:contact][:name], email: params[:company][:contact][:email], phone:  params[:company][:contact][:phone], company: @company)
      end
    end
end
