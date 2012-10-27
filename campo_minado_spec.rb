require_relative "campo_minado"

describe "Campo Minado" do
	it "constroi objeto com matriz" do
		campo_minado = CampoMinado.new([["*", "."], [".", "."]])
		campo_minado.matriz.should == [["*", "."], [".", "."]]
	end

	context "metodo bomba?" do
		before do
			@campo_minado = CampoMinado.new([["*", "."], [".", "."]])
		end
		it "posicao com bomba retorna true" do			
			@campo_minado.bomba?(0, 0).should be_true
		end
		it "posicao sem bomba retorna false" do
			@campo_minado.bomba?(0, 1).should be_false
		end
		it "posicao invalida retorna false" do
			@campo_minado.bomba?(42, 5).should be_false
		end
	end

	context "metodo jogada" do
		before do
			@campo_minado = CampoMinado.new([["*", ".", "."], [".", ".", "."]])
		end

		it "retorna o numero de bombas" do
			@campo_minado.jogada(0, 1).should == "1"			
			@campo_minado.jogada(1, 0).should == "1"
			@campo_minado.jogada(1, 1).should == "1"
			@campo_minado.jogada(0, 2).should == "0"
		end

		it "retorna false quando a posicao for uma bomba" do
			@campo_minado.jogada(0, 0).should == "*"
		end
	end

	it "metodo resultado" do
		campo_minado = CampoMinado.new([
			["*", ".", ".", "."], 
			[".", ".", ".", "."], 
			[".", "*", ".", "."], 
			[".", ".", ".", "."]
		])

		campo_minado.resultado.should == [
			["*", "1", "0", "0"], 
			["2", "2", "1", "0"], 
			["1", "*", "1", "0"], 
			["1", "1", "1", "0"]
		]
	end
end