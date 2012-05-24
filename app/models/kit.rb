class Kit < ActiveRecord::Base

  has_many  :parent_relationships,
            :class_name => 'KitRelationship',
            :foreign_key => :child_id,
            :dependent => :destroy

  has_many  :parents,
            :through  => :parent_relationships,
            :source => :parent

  has_many  :child_relationships,
            :class_name => 'KitRelationship',
            :foreign_key  => :parent_id,
            :dependent  => :destroy

  has_many  :children,
            :through => :child_relationships,
            :source => :child


  has_many :kit_products
  has_many :products, :through => :kit_products
  
  
  def all_products_including_children
    all_products ||= [] << products
     children.each do |child_kit|
       puts child_kit.id
       all_products << child_kit.products
       child_kit.all_products_including_children
     end
     return all_products.flatten
  end

  # def all_products_including_children
  #   all_products ||= products
  #   children.each do |child_kit|
  #     puts child_kit.id
  #     all_products << child_kit.products
  #     child_kit.all_products_including_children
  #   end
  #   return all_products
  # end

  def children_loop(xchildren)
    @ids ||= []
    xchildren.each do |child|
      @ids << child.id
      children_loop(child.children)
    end
    return @ids
  end

  def parents_loop(xparents)
    @ids ||= []
    xparents.each do |parent|
      @ids << parent.id
      parents_loop(parent.parents)
    end
    return @ids
  end


end
