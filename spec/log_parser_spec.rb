require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe LogParser do
  subject { described_class.new(file) }
  let(:file) { File.read("./spec/fixtures/webserver.log") }

  it "takes a file" do
    expect {
      described_class.new
    }.to raise_error(ArgumentError)
  end

  it "stores a file" do
    expect(subject.file).to eql(file)
  end

  describe "#parse" do
    it "returns an array of results" do
      subject.parse

      expect(subject.results).to be_an(Array)
    end

    it "counts the number of entries" do
      subject.parse

      expect(subject.results).to include({url: '/home', total: 78})
    end
  end
end
