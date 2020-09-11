class ImportController < ApplicationController
  def index
  end

  def users
    puts 'Coucou User'
    Person.import(params[:file])
    redirect_to root_path
  end

  def buildings
    puts 'Coucou Building'
    redirect_to root_path
  end
end
