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

RSpec.describe Link, "#score" do
  it "returns the upvotes minus the downvotes" do
    link = Link.new(upvotes: 2, downvotes: 1)

    expect(link.score).to eq Score.new(link)
  end
end

RSpec.describe Link, ".hottest_first" do
  it "returns the links: hottest to coldest" do
    coldest_link = build(:link, upvotes: 3, downvotes: 3)
    hottest_link = build(:link, upvotes: 5, downvotes: 1)
    lukewarm_link = build(:link, upvotes: 2, downvotes: 1)

    expect(Link.hottest_first).to eq [hottest_link, lukewarm_link, coldest_link]
  end
end
