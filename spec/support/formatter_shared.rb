shared_examples "formatter" do |input, output|
  describe "#format" do
    context "when the content is '#{input}'" do
      it "should be formatted as '#{output}'" do
        expect(subject.format(input)).to eq output
      end
    end
  end
end
