class CampoMinado
	attr_reader :matriz

	def initialize(matriz)
		@matriz = matriz
	end

	def jogada(linha, coluna)
		return "*" if bomba?(linha, coluna)
		contador = 0

		(-1..1).each do |incremento_linha|
			(-1..1).each do |incremento_coluna|
				contador +=1 if bomba?(linha+incremento_linha, coluna+incremento_coluna)
			end
		end

		contador.to_s
	end

	def bomba?(linha, coluna)
		linha_local = @matriz[linha]

		return false unless linha_local

		linha_local[coluna] == "*"
	end

	def resultado
		resultado = Array.new(@matriz.size) {|linha| linha = [] }

		@matriz.each_index do |linha|
			@matriz[linha].each_index do |coluna|
				 resultado[linha][coluna] = jogada(linha, coluna)				 
			end			
		end
		resultado
	end

end