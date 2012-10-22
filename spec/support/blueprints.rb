require 'machinist/active_record'


Patient.blueprint do
  patstamp { Time.gm(2012, 07, 13, 23, 5) }
  hospno   { "456" }
end

Admission.blueprint do
  admstatus { "Admitted" }
  admstamp  { Time.gm(2012, 07, 13, 23, 5) }
end

ToDoItem.blueprint do
  description  { "Some non-trivial task"  }
  patient      { Patient.make! :hospno => "999#{sn}"}
  patient_list { PatientList.make! }
end

User.blueprint do
  email    { "test-#{sn}@example.com" }
  password { "password" }
end

PatientList.blueprint do
  name { "Test List - #{sn}" }
end

Membership.blueprint do
  risk_level   { "low" }
  patient_list { PatientList.make! }
  patient      { Patient.make! }
end

Shift.blueprint do
  name { "On Call" }
end

Team.blueprint do
  name  { "A-Team" }
  shift { Shift.make!  }
end

HandoverList.blueprint do
  shift_date { Time.gm(2012,8,15,0,0).to_date  }
  team       { Team.make! }
end

Handover.blueprint do
  handover_list { HandoverList.make! }
  to_do_item    { ToDoItem.make! }
end
