require "./spec/spec_helper"
require "./lib/gate"
require "./lib/ticket"

RSpec.describe "Gate" do
  let(:umeda) { Gate.new(:umeda) }
  let(:juso) { Gate.new(:juso) }
  let(:mikuni) { Gate.new(:mikuni) }

  describe "Umeda to Juso" do
    it "is OK" do
      ticket = Ticket.new(150)
      umeda.enter(ticket)
      expect(juso.exit(ticket)).to be_truthy
    end
  end

  describe "Juso to mikuni" do
    context "fare is not enought" do
      it "is NG" do
        ticket = Ticket.new(150)
        umeda.enter(ticket)
        expect(mikuni.exit(ticket)).to be_falsey
      end

      it "is OK" do
        ticket = Ticket.new(190)
        umeda.enter(ticket)
        expect(mikuni.exit(ticket)).to be_truthy
      end
    end
  end

  describe "Juso to mikuni" do
    it "is OK" do
      ticket = Ticket.new(150)
      juso.enter(ticket)
      expect(mikuni.exit(ticket)).to be_truthy
    end
  end
end
