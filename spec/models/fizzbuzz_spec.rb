require 'spec_helper'

describe Fizzbuzz do
  it 'has maximum value of argument' do
    expect(described_class::MAX_VALUE).to eql 100_000_000_000
  end

  it 'has default page size 10' do
    expect(described_class::PER_PAGE).to eql 10
  end

  it 'has default size of FizzBuzzes set' do
    expect(described_class::DEFAULT_TOTAL).to eql 100
  end

  describe '#calculate' do
    it 'is a String' do
      expect(described_class.calculate(1)).to be_a String
    end

    it 'divisible by 3 is Fizz' do
      expect(described_class.calculate(6)).to eql 'Fizz'
    end

    it 'divisible by 5' do
      expect(described_class.calculate(10)).to eql 'Buzz'
    end

    it "divisible by 3 and 5 results 'FizzBuzz'" do
      expect(described_class.calculate(30)).to eql 'FizzBuzz'
    end

    it 'is input argument' do
      expect(described_class.calculate(4)).to eql '4'
    end
  end

  it '#format' do
    key = 'blabla'
    expect(described_class.format(key)).to eql 'fizzbuzz-blabla'
  end

  describe '#populate' do
    it 'is an Array' do
      expect(described_class.populate(1)).to be_a Array
    end

    it 'has default length' do
      stub_const('Fizzbuzz::DEFAULT_TOTAL', 2)
      expect(described_class.populate.length).to eq 2
    end

    describe 'hash item' do
      subject { described_class.populate.first }

      it { should be_a Hash }

      it 'key is Fixnum' do
        expect(subject[:key]).to be_a Fixnum
      end
    end

    it 'calls calculate' do
      expect(described_class).to receive(:calculate).once
      described_class.populate(1)
    end

    it 'calculates hashes with FizzBuzzes' do
      expect(described_class.populate(5)).to eql [
        { key: 1, value: '1' },
        { key: 2, value: '2' },
        { key: 3, value: 'Fizz' },
        { key: 4, value: '4' },
        { key: 5, value: 'Buzz' }
      ]
    end

    it 'returns nil when its argument exceeds maximum value' do
      stub_const('Fizzbuzz::MAX_VALUE', 1)
      expect(described_class.populate(2)).to be_nil
    end
  end
end
