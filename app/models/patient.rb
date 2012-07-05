class Patient < ActiveRecord::Base
  self.table_name = 'pats'
  self.primary_key = 'pat_id'
  alias :patient_id :id
  
  has_many :admissions, :primary_key => "hospno", :foreign_key => 'admhospno'
  has_many :to_do_items
  has_many :risk_level_events, :order=>"id ASC"
  has_many :patient_lists_patients
  has_many :patient_lists, :through => :patient_lists_patients

  def risk_level
    risk_level_events.last.risk_level
  end

  def risk_level=(new_value)
    risk_level_events.build(:risk_level=>new_value)
    save!
  end

  def to_dos
    to_do_items.select{|item| "todo" == item.status}
  end

  def pendings
    to_do_items.select{|item| "pending" == item.status}
  end

  def name
    "#{firstnames} #{lastname}"
  end

  def patient_detail # just for symmetry
    PatientDetail.new(admission)
  end

  def admission
    Admission.find_by_admpid(pat_id)
  end
end
