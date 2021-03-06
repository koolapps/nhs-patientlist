class HandoverItem < ActiveRecord::Base
  attr_accessible :to_do_item, :patient_list_to

  belongs_to :to_do_item
  belongs_to :patient_list_from, class_name: "PatientList"
  belongs_to :patient_list_to,   class_name: "PatientList"

  validates :to_do_item,        presence: true
  validates :patient_list_from, presence: true
  validates :patient_list_to,   presence: true
end
