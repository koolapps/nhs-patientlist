require 'spec_helper'

describe Patient do
  let(:patient) { Patient.make! }
  
  describe :todos do
    let(:last_item){patient.to_do_items.find_by_description("Do 2")}
    before do
      3.times do |i|
        patient.to_do_items.create(:description=>"Do #{i}")
      end
      last_item.update_attribute :status, 'pending'
    end

    it "displays items in state todo" do
      patient.to_dos.map(&:description).sort.should == ["Do 0", "Do 1"]
    end

    it "displays items in state pending" do
      patient.pendings.map(&:description).sort.should == ["Do 2"]
    end

    it "displays items that are done" do
      last_item.update_attribute :status, 'done'
      patient.done_items.map(&:description).sort.should == ["Do 2"]
    end
  end

  describe ".not_discharged" do
    let(:admission) { Admission.make! :patient => patient }

    before do
      Admission.make! :patient => patient, :admstatus => "Discharged"
      admission.save!
    end
    
    it "finds patients with an admission that has not been discharged" do
      Patient.not_discharged.should == [patient]
    end

    it "ignores patients discharged from all admissions" do
      admission.update_attribute(:admstatus, "Discharged")
      Patient.not_discharged.should == []
    end

    it "is chainable" do
      Patient.not_discharged.class.should == ActiveRecord::Relation
    end
  end

  describe "current_ward" do
    let!(:renal_admission) { Admission.make! :currward => "RENAL", :admstatus => "Admitted", :patient => patient }
    let!(:ortho_admission) { Admission.make! :currward => "ORTHO", :admstatus => "Discharged", :patient => patient }

    it "finds the ward name for the admission that has not been discharged" do
      patient.current_ward.should == "RENAL"
    end

    it "returns 'Discharged' when the patient is no longer in the hospital" do
      renal_admission.update_attribute(:admstatus, "Discharged")
      patient.current_ward.should == "Discharged"
    end
  end
end
