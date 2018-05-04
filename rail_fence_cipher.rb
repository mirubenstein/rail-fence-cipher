class RailFenceCipher
  def self.encode(message, rails_count)
    rail_structure(message, rails_count).
      sort_by(&:rail).
      map { |rail_position| message[rail_position.index - 1] }.
      join
  end

  def self.decode(message, rails_count)
    rail_structure(message, rails_count).
      sort_by(&:rail).
      each_with_index { |rail_position, index| rail_position.character = message[index] }.
      sort_by(&:index).
      map(&:character).
      join
  end

  def self.rail_structure(message, rails_count)
    rail_position = Struct.new(:index, :rail, :character)
    (1.upto(rails_count).to_a + (rails_count - 1).downto(2).to_a).
      cycle.
      take(message.length).
      each_with_object([]).
      with_index(1) { |(rail, output), index| output << rail_position.new(index, rail) }
  end

  VERSION = 1
end
