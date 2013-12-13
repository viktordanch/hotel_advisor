require 'spec_helper'

describe Comment do
  describe "create comment" do
    it "should create comment with valid params" do
      comment = FactoryGirl.build(:comment)
      expect(comment.save).to be_true
    end
    it "should not create comment without text" do
      comment = FactoryGirl.build(:comment, text: '')

      expect(comment.save).to be_false
    end
  end
end
