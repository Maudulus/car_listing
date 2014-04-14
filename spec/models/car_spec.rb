require 'spec_helper'

describe Car do
  it { should have_valid(:color).when('turquoise') }
  it { should_not have_valid(:color).when(nil, '') }

  it { should have_valid(:year).when('1980', '2014') }
  it { should_not have_valid(:year).when(nil, '', 'Nineteen Eighty-Four', 1977, 2015) }

  it { should have_valid(:mileage).when('200000') }
  it { should_not have_valid(:mileage).when(nil, '', "asdf") }

  it { should belong_to :manufacturer }
end
