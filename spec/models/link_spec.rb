require "rails_helper"

RSpec.describe Link, "validations" do
  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:url) }
end

RSpec.describe Link, "#upvote" do
  it "increments upvotes" do
    link = build(:link, upvotes: 1)

    link.upvote

    expect(link.upvotes).to eq 2
  end
end
