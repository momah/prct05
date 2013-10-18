# Fichero: tc_racional.rb
# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

# Cargar la biblioteca 'test/unit' 
# Hacer que la clase a testear sea una subclase de Test::Unit::TestCase 
# Escribir los métodos con el prefijo test_
# Afirmar (assert) las cosas que decidas que sean ciertas. 

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def setup
		@fraccion_0 = Fraccion.new(0,1)
		@fraccion_1 = Fraccion.new(1,3)
		@fraccion_2 = Fraccion.new(2,3)
	end
	 
	def teardown
	  # No hacemos nada por ahora
	end
	
	def test_class_type_check
		assert_equal true, @fraccion_1.is_a?(Fraccion)
		assert_equal true, @fraccion_1.instance_of?(Fraccion)
	end
	
	def test_objects_constructor

		assert_not_equal @fraccion_0, @fraccion_1 
		assert_not_equal @fraccion_1, @fraccion_2
		
		assert_equal true, @fraccion_1.respond_to?("to_s")
		assert_equal true, @fraccion_1.respond_to?("+")
		assert_equal true, @fraccion_1.respond_to?("-")
		assert_equal true, @fraccion_1.respond_to?("*")
		assert_equal true, @fraccion_1.respond_to?("/")
	end
	
	def test_attributes_constructor
		assert_equal true, @fraccion_0.num == 0
		assert_equal true, @fraccion_0.denom == 1
		assert_equal true, @fraccion_1.num == 1
		assert_equal true, @fraccion_1.denom == 3
		assert_equal true, @fraccion_2.num == 2
		assert_equal true, @fraccion_2.denom == 3	
		
		assert_equal false, @fraccion_1.num == 111
		assert_equal false, @fraccion_1.denom == 111
	end

	def test_simple
		assert_equal(@fraccion_0,Fraccion.new(0,100),"Comprobar 0/1 es igual a 0/100")	
		assert_equal(@fraccion_1,Fraccion.new(4,12),"Comprobar 1/3 es igual a 4/12")
		assert_equal(@fraccion_2,Fraccion.new(4,6),"Comprobar 2/3 es igual a 4/6")
	end
		
	def Zero_Division_Error
		assert ( ZeroDivisionError ) { Fraccion.new(0,0)}
	end		

	def test_sum
		assert_equal(Fraccion.new(1,1).to_s,(@fraccion_2+@fraccion_1).to_s,"Comprobar el metodo '+' de suma" )
	end

	def test_rest
		assert_equal(Fraccion.new(1,3).to_s,(@fraccion_2-@fraccion_1).to_s, "Comprobar el metodo '-' de resta" )
	end
	
	def test_mul
		assert_equal(Fraccion.new(2,9).to_s,(@fraccion_2*@fraccion_1).to_s, "Comprobar el metodo '*' de multiplicacion" )
	end
	
	def test_div
		assert_equal(Fraccion.new(2,1).to_s,(@fraccion_2/@fraccion_1).to_s, "Comprobar el metodo '/' de division" )
	end

end
