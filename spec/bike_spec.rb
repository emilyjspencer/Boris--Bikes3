require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}

  # it { is_expected.to respond_to :report_broken }
   #it { is_expected.to respond_to :broken? }

  #it 'can be reported as broken' do
    #subject.report_broken
    #expect(subject).to be_broken
  #end 

  it 'upon initialization, the bike cant be reported as broken' do
    expect(subject.broken).to eq false 
  end 

  it 'if the bike is reported as broken the broken status changes to true' do 
    subject.report_broken
    expect(subject.broken).to eq true
  end 

end  