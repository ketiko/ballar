require 'spec_helper'
require_relative '../../../lib/ballar/clock'

describe Ballar::Clock do
  before do
    begin
      subject.tick
    end while subject.balls != balls
  end

  subject { Ballar::Clock.new balls }

  context 'when 30 balls are added' do
    let(:balls) { (1..30).to_a }

    it 'cycles in 15 days' do
      expect(subject.days).to eq 15
    end
  end

  context 'when 45 balls are added' do
    let(:balls) { (1..45).to_a }

    it 'cycles in 378 days' do
      expect(subject.days).to eq 378
    end
  end
end
