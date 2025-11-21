require 'digest'
require 'base64'
require 'securerandom'

class IdeJson

    attr_accessor :tpAmb, :CNPJEmitente, :CPFUsuario

    include ValidacoesGenericas

    def initialize(ide_json = {})
        campos = {
            'tpAmb' => { minimo: 1, maximo: 1, contagem: 0 },
            'CNPJEmitente' => { minimo: 1, maximo: 1, contagem: 0 },
            'CPFUsuario' => {minimo: 1, maximo: 1, contagem: 0}
        }
        validarCamposNaoEspecificados(ide_json, campos, 'nfae/ide')
        validarOcorrenciaDeCampos(ide_json, campos, 'nfae/ide')
        ide_json.each do |key, value|
            send("#{key}=", value) if respond_to?("#{key}=")
        end    
    end

    def CPFUsuario= value
        validarTamanhETipoDoCampo(11, 11, 'nfae/ide/CPFUsuario', value, 'N')
        @CPFUsuario = value
    end

    def tpAmb= value
        tpAmbLista = ['1','2']
        validarListaDoValorDoCampo(tpAmbLista, value, 'nfae/ide/tpAmb')
        DataRepository.instance.set(:tpAmb, value)
        @tpAmb = value
    end

 
   
end