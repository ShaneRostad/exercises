# write a program that can calculate the hamming difference between two DNA strands

# if string1[0] != string2[0]

class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(other_strand)
    distance = 0
    @strand.each_with_index do |chr, idx|
      distance += 1 if chr != other_strand.chars[idx]
      break if idx + 1 >= other_strand.length
    end
    distance
  end
end
