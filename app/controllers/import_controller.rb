class ImportController < ApplicationController
  def index
  end

  def users
    Person.import(params[:file])
    redirect_to root_path
  end

  def buildings
    Building.import(params[:file])
    redirect_to root_path
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    redirect_to @person
  end

  private

  def person_params
    params.require(:person).permit(:firstname, :lastname, :email, :home_phone_number, :mobile_phone_number, :address)
  end
end
