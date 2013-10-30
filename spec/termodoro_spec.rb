require_relative 'spec_helper'

describe "Termodoro" do
  let(:input) {"10 minutes show this message"}
  let(:term) {Termodoro.new(input)}

  it "can be initialized" do 
    expect(Termodoro.new("test")).to be_an_instance_of(Termodoro)
  end

  it "can accept user input" do
    expect(term.arguments).to eq(input)
  end

  describe "Constants" do
    it "has a constant that represents number of seconds in a minute" do
      expect(Termodoro::SECS_IN_MIN / 60).to eq(1)
    end

    it "has a constant that represents number of seconds in an hour" do
      expect(Termodoro::SECS_IN_HOUR / 3600).to eq(1)
    end
  end

  describe "Methods on user input" do

    it "can parse and retreive the decimal provided" do
      expect(term.parse_number_of_units).to eq(10)
    end 

    it "can parse and retreive the unti of time provided" do
      expect(term.parse_time_unit).to eq("minutes")
    end

    it "can parse and retreive the message provided" do
      expect(term.parse_message).to eq("show this message")
    end

    it "allows the message to be optional" do
      no_message_arg = "10 seconds"
      term_alt = Termodoro.new(no_message_arg)
      expect(term_alt.command).to be_an_instance_of(String)
    end

    describe "Flexibility on wording of unit of time" do
      it "will accept partial matches of 'seconds'" do
        weird_seconds = "10 s"
        term_alt = Termodoro.new(weird_seconds)
        expect(term_alt.parse_time_unit).to eq("s")
      end



    end
  end

  describe "Internal logic" do
    it "can santize the message" do
      pending
    end

    it "can calculate" do
      pending
    end

    it "given a string, can return a well-formed command" do
      pending
    end
  end

end


