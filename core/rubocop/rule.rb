module Rubocop
  class Rule < Struct.new(:key, :description, :style_guide)
  end
end
