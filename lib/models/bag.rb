class Bag
  def initialize(description)
    @description = description
  end

  def color
    @color ||= find_color
  end

  def contents
    @content ||= find_contents
  end

  private

  attr_reader :description

  def find_color
    
  end

  def find_content

  end
end
