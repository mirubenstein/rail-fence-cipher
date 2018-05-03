class RailFenceCipher
  def self.encode(message, rails_count)
    down = true
    message.chars.
      group_by.
      with_index(1) do |_character, index|
      if down
        down = false if (index % (rails_count - 1)).zero?
        rails_count - (index % (rails_count - 1)) - 1
      else
        down = true if (index % (rails_count - 1)).zero?
        (index % (rails_count - 1)) + rails_count - 1
      end
    end.
      values.
      join
  end
end
