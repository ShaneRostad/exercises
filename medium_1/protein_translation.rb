# RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to

# Codons: "Aug", "UUU", "UCU"
# => Which become a polyeptide with the following sequence =>

# protein: "Methionine", "phenylalanine", "Serine"
class InvalidCodonError < StandardError ; end

class Translation
  CODONS = { "AUG" => "Methionine",
             "UUU" => "Phenylalanine",
             "UUC" => "Phenylalanine",
             "UUA" => "Leucine",
             "UUG" => "Leucine",
             "UCU" => "Serine",
             "UCC" => "Serine",
             "UCA" => "Serine",
             "UCG" => "Serine",
             "UAU" => "Tyrosine",
             "UAC" => "Tyrosine",
             "UGU" => "Cysteine",
             "UGC" => "Cysteine",
             "UGG" => "Tryptophan",
             "UAA" => "STOP",
             "UAG" => "STOP",
             "UGA" => "STOP" }


  def self.of_codon(strand)
    raise InvalidCodonError, "invalid codon" if CODONS[strand] == nil
    CODONS[strand]
  end

  def self.of_rna(strand)
    rna = strand.split(/(\w{3})/).delete_if {|item| item == ''}.map do |str|
      of_codon(str)
    end
    rna = rna.slice!(0..rna.index("STOP")-1) if rna.include?("STOP")
    rna
  end
end

strand = 'AUGUUUUAA'
p Translation.of_rna(strand)
