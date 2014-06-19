module SimonSays
  describe Game do
    let(:output) { double('output') }
    let(:game) { Game.new output }

    def generate_commands commands
      commands.each do |c|
        command_generator = double('command_generator')
        allow(command_generator).to receive(:generate) { c }
        game.command_generator = command_generator
        game.generate_new_command
      end
    end

    describe "#start" do
      it "sends a welcome message" do
        expect(output).to receive(:puts).with('Welcome to Simon Says')
        expect(output).to receive(:puts).with('Please, enter your name:')
        game.start
      end
    end

    describe "#enter" do
      it "enters the game when user writes his name" do
        expect(output).to receive(:puts).with("Nice to meet you, sebastian, lets play...")
        game.enter "sebastian"
      end

      it "exists when user don't give his name" do
        expect(output).to receive(:puts).with("I don't play with anonymous, bye")
        expect { game.enter '' }.to raise_error Game::GameOver
      end
    end

    describe "#simon_says" do
      it "says A,B,C" do
        generate_commands %w{A B C}

        expect(output).to receive(:puts).with("Simon says: A,B,C")
        game.simon_says
      end
    end

    describe "#tell_simon" do
      it "tell Simon correct command" do
        generate_commands %w{A B C}

        expect(output).to receive(:puts).with("Simon says: A,B,C")
        expect(output).to receive(:puts).with("Correct. Now try to remember 4 commands.")
        expect(output).to receive(:puts).with("Your score: 3")
        game.simon_says
        game.tell_simon CommandList.new('A,B,C')
      end

      it "tell Simon incorrect command" do
        generate_commands %w{A B C D}

        expect(output).to receive(:puts).with("Simon says: A,B,C,D")
        expect(output).to receive(:puts).with("Game over")
        expect(output).to receive(:puts).with("Your score: 3")
        game.simon_says
        expect { game.tell_simon CommandList.new('A,B,C,X') }.to raise_error Game::GameOver
      end
    end

  end
end
