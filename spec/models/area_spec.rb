require 'rails_helper'

RSpec.describe Area, type: :model do
  it { should have_many(:cities).dependent(:destroy) }

  it { should validate_presence_of(:area) }
  it { should validate_presence_of(:price) }
end