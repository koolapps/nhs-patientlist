class Patient < ActiveRecord::Base
  self.table_name = 'pats'
  self.primary_key = 'pat_id'
  alias :patient_id :id

  has_many :admissions, :primary_key => "hospno", :foreign_key => 'admhospno'
  has_many :to_do_items
  has_many :risk_level_events, :order=>"id ASC"
  has_many :memberships
  has_many :patient_lists, :through => :memberships

  def self.not_discharged
    joins <<-EOS
      inner join adms on
        pats.hospno = adms.admhospno
      where
        adms.admstatus = 'Admitted'
    EOS
  end

  def risk_level
    event = risk_level_events.last
    event ? event.risk_level : 'low'
  end

  def current_ward
    admission = admissions.find_by_admstatus("Admitted")
    return admission.currward if admission
    "Discharged"
  end

  def risk_level=(new_value)
    risk_level_events.build(:risk_level=>new_value)
    save!
  end

  def name
    "#{firstnames} #{lastname}"
  end

  def patient_detail # just for symmetry
   @detail ||= PatientDetail.new(admission)
  end

  def admission
    Admission.find_by_admpid(id)
  end
end
