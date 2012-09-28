class ListsController < ApplicationController
  expose(:patient_list) { PatientList.find params[:id] }

  # GET
  def index
    
  end

  # GET
  def show
    session[:current_list] = patient_list.id    
  end

  # POST
  def create
    new_list = current_user.patient_lists.new params[:patient_list]
    if new_list.save
      redirect_to list_path(new_list), :notice => "Created #{new_list.name}"
    else
      flash[:alert] = "Could not create list: #{new_list.errors.full_messages.join(",")}"
      redirect_to lists_path
    end
  end
end
