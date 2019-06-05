require 'rails_helper'

RSpec.describe Article do
  subject {Article.new}
  fixtures :categories

  it "is not valid without a title" do
    expect(subject).not_to be_valid
  end

  it "is not valid with a title shorter than 3 symbols " do
    subject.title = 'a' * 2
    subject.text = 'grtgegerrgrg'
    subject.category_id = 3
    expect(subject).not_to be_valid
  end

  it "is valid with proper data" do
    subject.title = 'a' * 10
    subject.text = 'b' * 8
    subject.category_id = 2
    expect(subject).to be_valid
  end
end
