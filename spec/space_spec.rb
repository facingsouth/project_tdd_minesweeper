require 'space'


describe Space do

  let (:space){Space.new(5,5)}

  describe "#initialize" do


    it 'should initialize a Space' do

      expect(space.class).to eql(Space)

    end

    it 'should set default value' do

      expect(space.render).to eql("\u25A0 ")
      expect(space.is_a_mine).to be(false)
      expect(space.number).to eql(0)
      expect(space.hidden).to be(true)

    end

  end




end
