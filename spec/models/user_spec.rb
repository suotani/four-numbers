require 'rails_helper'
RSpec.describe User, type: :model do
  describe "validations" do
    describe "#username" do
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_uniqueness_of(:username)}
      it { is_expected.to validate_length_of(:username).is_at_most(20)}
    end
    describe "#password" do
      it { is_expected.to validate_presence_of(:password) }
    end
  end
end