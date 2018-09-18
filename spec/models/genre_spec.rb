require 'rails_helper'

RSpec.describe Genre, type: :model do
  it {should validate_presence_of(:name)}
  it {should have_and_belong_to_many(:songs)}
end
