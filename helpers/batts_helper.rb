module BattsHelper
	def system_volts(watts)
		case watts
			when 0..600
				12
			when 600..2000
				24
			else
				48	
		end		
	end

end