module SimonSays
  describe CommandList do

    let(:command_list) {
      cl = CommandList.new
      %w{A B C}.each { |c| cl.add(c) }
      cl
    }

    describe "#size" do
      it "gets size of the commands" do
        expect(command_list.size).to be(3)
      end
    end

    describe "#to_s" do
      it "gets commands as string" do
        expect(command_list.to_s).to eq("A,B,C")
      end
    end

    describe "#equal" do
      context "checks if command lists are equal" do
        it "returns true when are equal" do
          other_command_list = CommandList.new
          %W{A B C}.each {|c| other_command_list.add c }
          expect(command_list.equal? other_command_list).to be(true)
        end

        it "returns false when are not equal" do
          other_command_list = CommandList.new
          %W{A B}.each {|c| other_command_list.add c }
          expect(command_list.equal? other_command_list).to be(false)
        end
      end
    end

  end
end