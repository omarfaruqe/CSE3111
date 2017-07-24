require 'rails_helper'

RSpec.describe Registrar, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:about) }
  it { should validate_presence_of(:contact) }

end
