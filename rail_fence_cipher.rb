class RailFenceCipher
  def self.encode(message, rails_count)
    return message if rails_count == 1
    down = true
    message.chars.
      group_by.
      with_index(1) do |_character, index|
      if down
        down = false if flip(index, rails_count)
        if down
          index % (rails_count - 1)
        else
          rails_count - 1
        end
      else
        down = true if flip(index, rails_count)
        if down
          2
        else
          rails_count + 1 - (index % (rails_count - 1))
        end
      end
    end.
      values.
      join
  end

  def self.flip(index, rails_count)
    (index % (rails_count - 1)).zero?
  end
end
# 'ESXIEECSR', RailFenceCipher.encode('EXERCISES' 4 rails
# E           S
#   X       I   E
#     E   C       S
#       R


# 1,2,0
# 4

# 3,2,1
# 4
