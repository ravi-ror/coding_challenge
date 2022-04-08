class MySet < Hash
  def connect(child:, parent:)
    self[parent.to_sym] = child
  end

  def insert hash
    validate_set(hash)
    self.merge!(hash)
  end
end

class DisjointSet
  attr_reader :sets

  def initialize
    @sets = []
  end

  def insert_set(set)
    @sets.push(set)
  end

  def find(element)
    sets.each do |set|
      return set[element.to_sym] if set.has_key?(element.to_sym)
    end
    return nil
  end

  def union(element_1, element_2)
    set_1_index = nil
    set_2_index = nil

    sets.each_with_index do |set, index|
      if set.has_key?(element_1.to_sym)
        set_1_index = index if set.has_key?(element_1.to_sym)
      elsif set.has_key?(element_2.to_sym)
        set_2_index = index if set.has_key?(element_2.to_sym)
      end 
    end

    return if set_1_index.nil? || set_2_index.nil?
    return if set_1_index == set_2_index

    sets[set_1_index].merge!(@sets[set_2_index])
    sets[set_2_index] = nil
    sets[set_1_index][element_2.to_sym] = element_1
    sets.compact!
  end
end



disjoint = DisjointSet.new
set_1 = MySet.new.insert({ a: 'a', b: 'a', c: 'b', d: 'a' }) # { child: parent }
set_2 = MySet.new.insert({ e: 'f', f: 'f', g: 'f', h: 'g' })
disjoint.insert_set(set_1)
disjoint.insert_set(set_2)
disjoint.find('b') # returns parent of b if it exists in any set
disjoint.union('a', 'f')


############################################################################


class DisjointSet
  attr_reader :set

  def initialize
    @set = []
  end

  def insert(element)
    @set.push(element) unless set.include?(element)
  end

  def disjoint? set
    (@set & set).empty?
  end

  def union(set)
    return nil unless disjoint? set
    @set.push(*set)
  end
end

d = DisjointSet.new
d.insert(3)
d.insert(4)
d.insert(5)
d.disjoint?([1, 6, 7, 8])
d.union([1, 6, 7, 8])