class KitRelationship < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Kit'
  belongs_to :child, :class_name => 'Kit'

  validate :parent_and_child_cannot_be_same, :cannot_have_multiple_parents
  validate :child_can_not_have_a_parent_as_a_child, :parent_can_not_have_a_child_as_a_parent #infinate_loop_guard

  def parent_and_child_cannot_be_same
    if parent_id == child_id
      errors.add(:id, "Computer Says Noooooo... Parent & Child cannot be the same.")
    end
  end


  def each_child(children)
    children.each do |child|
      puts "Hello"
      child.each_child(child.children)
    end
  end


  def child_can_not_have_a_parent_as_a_child
    if parent.parents_loop(parent.parents).include?(child.id)
      errors.add(:id, "Computer Says Noooooo... Parent as a child.")
    end
  end

  def parent_can_not_have_a_child_as_a_parent
    if child.children_loop(child.children).include?(parent.id)
      errors.add(:id, "Computer Says Noooooo... Child as a parent. ")
    end
  end

  def cannot_have_multiple_parents
    #binding.pry
  end



end
