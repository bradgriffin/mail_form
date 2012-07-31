require 'test_helper'
require 'fixtures/sample_mail'

class ComplianceTest < ActiveSupport::TestCase
	include ActiveModel::Lint::Tests

	test "model_name.human uses I18n" do 
		begin
			I18n.backend.store_translations :en,
			  :activemodel => { :models => { :sample_mail => "My Sample Email" } }
			assert_equal "My Sample Email", model.class.model_name.human
		ensure
			I18n.reload!
		end
	end

	test "model_name exposes singular and human name" do
		assert_equal "sample_mail", model.class.model_name.singular
		assert_equal "Sample mail", model.class.model_name.human
	end

	def setup
		@model = SampleMail.new
	end
end