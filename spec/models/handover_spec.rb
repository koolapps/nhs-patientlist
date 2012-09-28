require 'spec_helper'

describe Handover do
  it { should belong_to(:to_do_item) }
  it { should belong_to(:grade) }
  it { should belong_to(:handover_list) }

  it { should validate_presence_of(:to_do_item_id) }
  it { should validate_presence_of(:grade_id) }

  it "is audited in creation" do
    handover = Handover.make!
    handover.audits.count.should == 1
    handover.audits.first.action.should == "create"
  end
end
