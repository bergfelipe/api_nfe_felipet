# 📄 API NF-e Felipet

API desenvolvida para emissão de Nota Fiscal Eletrônica (NF-e), seguindo todas as regras e validações da SEFAZ.  
O serviço recebe os dados da nota, gera o XML, assina digitalmente com certificado A1, valida contra os XSDs oficiais e envia para o WebService da SEFAZ.

---

## 🚀 Deploy

A API está publicada em:

👉 **https://api-nfe-felipet.onrender.com**

---

## 🧩 Funcionalidades

- ✅ Geração de XML NF-e (modelo 55)  
- ✅ Assinatura digital com certificado A1 (.pfx)  
- ✅ Validação do XML com XSDs oficiais  
- ✅ Envio da NF-e para o WebService da SEFAZ  
- ✅ Consulta do protocolo de autorização  
- ✅ Retorno estruturado e detalhado da emissão  
- ⚙️ Preparada para integração com qualquer sistema (Rails, Node, Next.js, etc.)

---

## 🛠️ Tecnologias Utilizadas

- Ruby on Rails  
- Ruby 3.x  
- Nokogiri (XML)  
- Savon (SOAP)  
- OpenSSL (assinatura digital)  
- PostgreSQL (Render)  
- Rack / Puma  

---

# 📡 Endpoints da API

---

# 🔍 GET `/v1/consulta/:CPF_USUARIO`
Endpoint responsável por consultar todas as NF-e emitidas por um usuário específico dentro da API (CPF do emissor da nota).
**URL:**
https://api-nfe-felipet.onrender.com/v1/consulta/:CPF_USUARIO
### Exemplo de resposta esperada

{
    "codigo": 200,
    "mensagem": "Notas encontradas.",
    "notas": [
        {
            "id": 4,
            "SCHEMA": "nfe_v4.00",
            "CHAVE": "11251105599253000147558980000000041483060445",
            "IP": "",
            "CPF_USUARIO": "",
            "EMIT_ID": "",
            "NPROT": "",
            "DT_INI": "",
            "DT_WS_AUTORIZACAO": "",
            "CSTAT_CONSULTA": "",
            "XMOTIVO_CONSULTA": "",
            "NREC": "",
            "NNF": "",
            "COD_RECEITA": "",
            "COD_RECEITA_PARTILHA": "",
            "ATIVIDADE": "",
            "CSTAT_AUTORIZAR": "",
            "XMOTIVO_AUTORIZAR": "",
            "DT_WS_CONSULTA": "",
            "XML_ASSINADO_AUTORIZACAO": "",
            "DT_AUTORIZACAO": "",
            "DT_FIM": "",
            "CANCELADA": "",
            "SERIE": "",
            "IE": "",
            "IDARON": "",
            "GTA": "",
            "created_at": "",
            "updated_at": ""
        }
    ]
}

---

# 🔥 POST `/v1/emissao`
Endpoint responsável por emitir uma NF-e completa.
**URL:**
https://api-nfe-felipet.onrender.com/v1/emissao
### Body JSON (payload esperado)
```json
{
  "pfx_base64": "",
  "senha_certificado": "",
  "nota": {
    "ide": {
      "tpAmb": "",
      "CPFUsuario": "",
      "CNPJEmitente": ""
    },
    "emit": {
      "CPF": "",
      "xNome": "",
      "xFant": "",
      "xLgr": "",
      "nro": "",
      "xCpl": "",
      "xBairro": "",
      "cMun": "",
      "CEP": "",
      "fone": "",
      "IE": ""
    },
    "dest": {
      "CNPJ": "",
      "xNome": "",
      "xLgr": "",
      "nro": "",
      "xCpl": "",
      "xBairro": "",
      "cMun": "",
      "CEP": "",
      "fone": "",
      "indIEDest": "",
      "IE": ""
    },
    "prods": [
      {
        "cProd": "",
        "xProd": "",
        "NCM": "",
        "CFOP": "",
        "uCom": "",
        "qCom": "",
        "vUnCom": "",
        "uTrib": "",
        "qTrib": "",
        "CST": "",
        "pRedBC": "",
        "pICMS": "",
        "pICMSUFDest": ""
      }
    ],
    "transp": {
      "modFrete": "",
      "transporta": {
        "CPF": "",
        "xNome": "",
        "IE": "",
        "xEnder": "",
        "xMun": "",
        "UF": ""
      },
      "veicTransp": {
        "placa": "",
        "UF": "",
        "RNTC": ""
      },
      "vol": {
        "qVol": "",
        "esp": "",
        "marca": "",
        "nVol": ""
      }
    },
    "pag": {
      "tPag": ""
    },
    "infAdic": {
      "infCpl": ""
    }
  }
}
