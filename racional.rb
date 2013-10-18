# Implementar en este fichero la clase para crear objetos Fracciones

require "./gcd.rb"

class Fraccion
	
	include Comparable
	include Enumerable
	
	
	def initialize(num, denom)
		raise ZeroDivisionError, "El denominador debe ser mayor que cero" unless (denom != 0)
		div = gcd(num, denom)
		@num = num/div
		@denom = denom/div
	end
	
	attr_accessor :num, :denom
	
	def to_s
		"#{@num}/#{@denom}"
	end
	
	def +(o)
		Fraccion.new(@num*o.denom + o.num*@denom, @denom*o.denom)
	end
	
	def -(o)
		Fraccion.new(@num*o.denom - o.num*@denom, @denom*o.denom)
	end
	
	def *(o)
		Fraccion.new(@num*o.num,@denom*o.denom)
	end
	
	def /(o)
		Fraccion.new(@num*o.denom,@denom*o.num)
	end
	
	def ==(o)
		if o.instance_of? Fraccion
			@num == o.num && @denom == o.denom
		else
			false
		end
	end
	
end


