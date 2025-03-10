# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = build(:comment)
  end

  def test_comment_should_be_invalid_without_content
    @comment.content = ""
    assert @comment.invalid?
  end

  def test_comment_content_should_not_exceed_maximum_length
    @comment.content = "a" * (Comment::MAX_CONTENT_LENGTH + 1)
    assert @comment.invalid?
  end

  # This checks whether a valid comment is created or not by checking the difference between the count
  # of previous state and count of present state of table
  def test_valid_comment_should_be_saved
    assert_difference "Comment.count" do
      @comment.save
    end
  end

  def test_comment_should_not_be_valid_without_user
    @comment.user = nil
    assert @comment.invalid?
  end

  def test_comment_should_not_be_valid_without_task
    @comment.task = nil
    assert @comment.invalid?
  end
end
