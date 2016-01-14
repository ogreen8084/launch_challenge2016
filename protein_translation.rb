# create custom InvalidCodonError class
class InvalidCodonError < StandardError; end
# Translate RNA sequences into proteins.
class Translation
  PROTEIN_TRANS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
                    'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
                    'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
                    'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine',
                    'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
                    'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
                    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP' }

  def self.of_rna(strand)
    new_strand = []
    strand = strand.scan(/.{3}/)

    strand.each do |codon|
      if of_codon(codon) == 'STOP'
        break
      else
        new_strand << of_codon(codon)
      end
    end
    new_strand
  end

  def self.of_codon(codon)
    if PROTEIN_TRANS.keys.include?(codon)
      PROTEIN_TRANS[codon]
    else
      fail InvalidCodonError
    end
  end
end
