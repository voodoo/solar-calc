module WattsHelper
	def sum_of(section)
		data.watts[section].map do |item|
			name, watts, hours = item
			watts * hours
		end.reduce(:+)
	end

	def sum_of_totals totals
		totals.map do |total|
			sum_of(total)
		end.reduce(:+)
	end

	def total_watt_hours
		sum_of_totals [:need, :want, :lux]
	end

	def number_of_panels watts
		(watts / data.calc.panels[:insolation] / data.calc.panels[:size]) + 1
	end

	def google_it term, search
		link_to term, "https://www.google.com/search?q=#{search}", target: :_blank
	end
end