# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  attr_accessor :data
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.lines
    key_arr = lines[0].chomp("\n").split("\t")

    @data = lines[1..-1].map do |line|
      value = line.chomp("\n").split("\t")
      key_arr.zip(value).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = @data[0].keys.join("\t") + "\n"
    @data.each do |hash|
      tsv += hash.values.join("\t") + "\n"
    end
    tsv
  end
end
