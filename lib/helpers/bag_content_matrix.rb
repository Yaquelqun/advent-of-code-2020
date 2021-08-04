class BagContentMatrix

  def initialize(bags)
    @bags = bags
  end

  def containers_count_for(color:)
    #HARD LOGIC GOES THERE
  end

  private

  attr_reader :bags

  def matrix
    @matrix ||= build_matrix
  end
end