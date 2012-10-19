
class PatientListsController < ApplicationController

  # user's own lists (create and update)
  expose(:own_patient_lists) { current_user.patient_lists }
  expose(:own_patient_list)

  # other users' public lists
  expose(:user)
  expose(:user_patient_lists) { user.patient_lists }
  expose(:user_patient_list)

  def create
    if own_patient_list.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "Successfully created list" }
        format.json { render json: own_patient_list.to_json }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: "Could not create list" }
        format.json { render json: own_patient_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if own_patient_list.save
      redirect_to :action => :index, :notice => "Successfully updated list"
    else
      render :edit
    end
  end

  def destroy
    begin
      own_patient_list.destroy
      redirect_to root_path, :notice => "Successfully removed list"
    rescue
      redirect_to :action => :show, :notice => "Could not delete list"
    end
  end


end
