def sometimes(probability, value, backup = nil)
  rand <= probability ? value : backup
end
