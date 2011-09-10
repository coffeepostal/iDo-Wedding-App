class Integer
	@@singles ||= ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
	@@teens		||= ['ten', 'eleven', 'twelve', 'thirteen', '', 'fifteen']
	@@tens		||= ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
	@@places	||= [ 'hundred', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion',
									'sextillion', 'septillion', 'octillion', 'nonillion', 'decillion', 'undecillion',
									'duodecillion', 'tredecillion', 'quattuordecillion', 'quindecillion', 'sexdecillion',
									'septendecillion', 'octodecillion', 'novemdecillion', 'vigintillion'] # etc.
									
	# (QUICKLY) Converts a number into English words.
	# Currently only supports numbers up to the vigintillions (10^63).
	def to_word
		numstr		= self.to_s
		numstrln	= numstr.length
		numsplit	= numstr.split('')
	
		case numstrln
		when 0 # we have nothing
			return ''
			break
		when 1 # 0 through 9
			return @@singles[self]
			break
		when 2 # 10 through 99
			return [0,1,2,3,5].include?(numsplit.last.to_i) ? @@teens[numsplit.last.to_i] : @@singles[numsplit.last.to_i].chomp('t') + 'teen' if self < 20
			return [@@tens[numsplit.first.to_i], (@@singles[numsplit.last.to_i] unless numstr.end_with?('0'))].compact.join('-')
			break
		else
			pieces = (numstrln == 3 ? [numstr.slice!(0,1), numstr] : [numstr.slice!(0, (numstrln % 3 == 0 ? 3 : numstrln % 3)), numstr])
			return [pieces.first.to_i.to_word + "-#{@@places[(numstrln - 1) / 3]}", (pieces.last.to_i.to_word unless pieces.last.to_i.zero?)].compact.join(' ')
			break
		end
	end
end
