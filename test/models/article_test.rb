require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    logger = Logger.new(STDOUT)
    Article.any_instance.stubs(:logger).returns(logger)
    logger.stubs(:debug).returns(true)
    Rails.logger = logger
  end
  test "Encryptor#encrypt is called twice on save" do

    # expected to happen once when the record is initialized
    Rails.logger.expects(:info).with("encrypting My Title")
    # expected to happen once when the record is saved
    Rails.logger.expects(:info).with("encrypting My Title")
    # I was not expecting it a third time when the record is saved
    Rails.logger.expects(:info).with("encrypting My Title")

    Rails.logger.expects(:info).with("decrypting...").once
    a = Article.create(title: "My Title")
  end
end
