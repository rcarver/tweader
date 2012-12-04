require 'minitest/spec'
require 'minitest/hell'
require 'minitest/autorun'

require 'tweader'

class BaseSpec < MiniTest::Spec

  register_spec_type(self) { true }

  def stub(methods = {})
    mock = MiniTest::Mock.new
    methods.each do |name, value|
      mock.expect(name, value)
    end
    mock
  end

end


