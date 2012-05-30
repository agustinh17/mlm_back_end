require 'spec_helper'

describe Identity, "Validations" do
  before do
    @identity = Factory(:identity)
  end

  subject { @identity }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("testing@test.com").for(:email) }
  it { should validate_presence_of(:package) }
  it { should validate_presence_of(:referred_by) }
  it { should validate_presence_of(:referer_id) }
  it { should validate_numericality_of(:home_phone) }
  it { should validate_numericality_of(:cell) }
end
