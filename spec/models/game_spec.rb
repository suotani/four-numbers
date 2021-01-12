require 'rails_helper'
RSpec.describe Game, type: :model do
  describe "validations" do
    describe "#title" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(20)}
    end

    describe "#limit" do
      it { is_expected.to validate_presence_of(:limit) }
    end

    describe "#number" do
      it { is_expected.to validate_presence_of(:number) }
      it { is_expected.to validate_length_of(:number).is_at_most(4)}
      it { is_expected.to validate_length_of(:number).is_at_least(4)}
    end
    
    describe "#number" do
      it { is_expected.to validate_presence_of(:number) }
    end
  end
end