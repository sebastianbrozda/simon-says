module SimonSays
  describe CommandGenerator do
    describe "#generate" do
      it "generates a new command" do
        command = CommandGenerator.instance.generate
        expect(command).to be_a_kind_of(String)
      end
    end
  end
end