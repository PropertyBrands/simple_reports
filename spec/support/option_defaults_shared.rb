shared_examples "option defaults" do |options|
  it_behaves_like "optional option defaults", options

  options.each do |option|
    describe "##{option}" do
      context "when option is not provided" do
        it "raises a KeyError" do
          expect { subject.send(option) }.to raise_exception KeyError
        end
      end
    end
  end
end

shared_examples "optional option defaults" do |options|
  options.each do |option|
    describe "##{option}" do
      context "when option is provided" do
        let(:options) { { option => 'value' } }
        its(option) { should eq 'value' }
      end
    end
  end
end
