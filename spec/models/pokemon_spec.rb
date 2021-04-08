require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:user) {User.create(email: 'user_1@gmail.com', password: '12345678', password_confirmation: '12345678')}

  let(:poke_1) { Pokemon.create( number: 100, name: 'poke_one_name', type_1:'new',  total: 76,
  hp: 33, attack: 12, defense: 33, sp_atk: 15, sp_def: 20, speed: 19, generation:1, legendary: true, user_id: user.id ) }

  let(:poke_2) {Pokemon.create(  number: 101, name: 'poke_two_name', type_1:'new',  total:88,
   hp: 33, attack: 12, defense: 22, sp_atk: 31, sp_def: 10, speed: 15, generation: 2, legendary: true, user_id: user.id ) }

  describe "Validation" do
    it "should has a unique name" do
      expect(poke_1).to be_valid
      expect(poke_2).to be_valid
      poke_2.name = "poke_one_name"
      expect(poke_2).not_to be_valid
    end

    it "should has a name" do
      expect(poke_1).to be_valid
      poke_1.name = ""
      expect(poke_1).not_to be_valid
    end

    it "should has a number" do
      expect(poke_1).to be_valid
      poke_1.number = nil
      expect(poke_1).not_to be_valid
    end

    it "should has a type_1" do
      expect(poke_1).to be_valid
      poke_1.type_1 = nil
      expect(poke_1).not_to be_valid
    end

    it "should has a total" do
      expect(poke_1).to be_valid
      poke_1.total = nil
      expect(poke_1).not_to be_valid
    end

    it "should has a speed" do
      expect(poke_1).to be_valid
      poke_1.speed = nil
      expect(poke_1).not_to be_valid
    end

    it "should has a generation" do
      expect(poke_1).to be_valid
      poke_1.generation = nil
      expect(poke_1).not_to be_valid
    end
  end
  
end
