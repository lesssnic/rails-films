require "rails_helper"

RSpec.describe Director, type: :model do
  subject { Director.new(first_name: "Jack", last_name: "Daniels") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
end
