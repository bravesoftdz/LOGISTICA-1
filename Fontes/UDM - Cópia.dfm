object tb_pessoa: Ttb_pessoa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 700
  Width = 737
  object BDConnectionSQL: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=LOGISTICA;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 28
  end
  object DtsUsuarios: TADODataSet
    Connection = BDConnectionSQL
    CursorType = ctStatic
    CommandText = 'USUARIOS'
    CommandType = cmdTable
    Parameters = <>
    Left = 128
    Top = 36
    object DtsUsuariosID_USUARIO: TAutoIncField
      FieldName = 'ID_USUARIO'
      KeyFields = 'ID_USUARIO'
    end
    object DtsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object DtsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object DtsUsuariosMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 10
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = DtsUsuarios
    Left = 128
    Top = 92
  end
  object cdsUsuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 128
    Top = 156
    object cdsUsuariosID_USUARIO: TAutoIncField
      FieldName = 'ID_USUARIO'
    end
    object cdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object cdsUsuariosMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 10
    end
  end
  object QryIdUsuario: TADOQuery
    Connection = BDConnectionSQL
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM USUARIOS')
    Left = 128
    Top = 228
    object QryIdUsuarioID_USUARIO: TAutoIncField
      FieldName = 'ID_USUARIO'
      ReadOnly = True
    end
    object QryIdUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object QryIdUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object QryIdUsuarioMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 10
    end
  end
  object DtsProdutos: TADODataSet
    Connection = BDConnectionSQL
    CursorType = ctStatic
    CommandText = 'PRODUTOS'
    CommandType = cmdTable
    Parameters = <>
    Left = 216
    Top = 36
    object DtsProdutosID_PRODUTO: TAutoIncField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object DtsProdutosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object DtsProdutosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object DtsProdutosID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object DtsProdutosVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 10
      Size = 2
    end
    object DtsProdutosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = DtsProdutos
    Left = 216
    Top = 92
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 216
    Top = 156
    object cdsProdutosID_PRODUTO: TAutoIncField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object cdsProdutosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsProdutosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsProdutosID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsProdutosVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 10
      Size = 2
    end
    object cdsProdutosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object QryIdProduto: TADOQuery
    Connection = BDConnectionSQL
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM PRODUTOS')
    Left = 216
    Top = 228
    object QryIdProdutoID_PRODUTO: TAutoIncField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object QryIdProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryIdProdutoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object QryIdProdutoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object QryIdProdutoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 10
      Size = 2
    end
    object QryIdProdutoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object DtsPessoas: TADODataSet
    Connection = BDConnectionSQL
    CursorType = ctStatic
    CommandText = 'PESSOAS'
    CommandType = cmdTable
    Parameters = <>
    Left = 296
    Top = 36
    object DtsPessoasID_PESSOA: TAutoIncField
      FieldName = 'ID_PESSOA'
      ReadOnly = True
    end
    object DtsPessoasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object DtsPessoasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 50
    end
    object DtsPessoasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 50
    end
    object DtsPessoasTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object DtsPessoasID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
    end
  end
  object dspPessoas: TDataSetProvider
    DataSet = DtsPessoas
    Left = 296
    Top = 92
  end
  object cdsPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoas'
    Left = 296
    Top = 156
    object cdsPessoasID_PESSOA: TAutoIncField
      FieldName = 'ID_PESSOA'
      ReadOnly = True
    end
    object cdsPessoasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPessoasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 50
    end
    object cdsPessoasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 50
    end
    object cdsPessoasTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPessoasID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
    end
  end
  object QryIdPessoa: TADOQuery
    Connection = BDConnectionSQL
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM PESSOAS')
    Left = 296
    Top = 228
    object QryIdPessoaID_PESSOA: TAutoIncField
      FieldName = 'ID_PESSOA'
      ReadOnly = True
    end
    object QryIdPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryIdPessoaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 50
    end
    object QryIdPessoaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 50
    end
    object QryIdPessoaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object QryIdPessoaID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
    end
  end
  object BDConnectionFB: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\Projects\L' +
        'ogistica\Sistema Logistica\Banco Firebird\LOGISTICA.FDB'
      'Password=masterkey'
      'User_Name=sysdba'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 334
  end
  object ds_usuario: TDataSource
    DataSet = sql_usuario
    Left = 88
    Top = 470
  end
  object sql_usuario: TFDQuery
    IndexesActive = False
    Connection = BDConnectionFB
    SQL.Strings = (
      'select * from usuarios')
    Left = 88
    Top = 534
    object sql_usuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sql_usuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 30
    end
    object sql_usuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 30
    end
    object sql_usuarioMASTER: TStringField
      FieldName = 'MASTER'
      Origin = 'MASTER'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object tb_usuario: TFDTable
    IndexFieldNames = 'ID_USUARIO'
    Connection = BDConnectionFB
    UpdateOptions.UpdateTableName = 'USUARIOS'
    TableName = 'USUARIOS'
    Left = 88
    Top = 406
    object tb_usuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_usuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 30
    end
    object tb_usuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 30
    end
    object tb_usuarioMASTER: TStringField
      FieldName = 'MASTER'
      Origin = 'MASTER'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 248
    Top = 334
  end
  object FireBird: TFDPhysFBDriverLink
    Left = 176
    Top = 334
  end
  object sql_Gen_usuario: TFDQuery
    Connection = BDConnectionFB
    SQL.Strings = (
      'select gen_id(id_usuario,1)as id from rdb$database')
    Left = 344
    Top = 336
    object sql_Gen_usuarioID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object tb_produto: TFDTable
    IndexFieldNames = 'ID_PRODUTO'
    Connection = BDConnectionFB
    UpdateOptions.UpdateTableName = 'PRODUTOS'
    TableName = 'PRODUTOS'
    Left = 168
    Top = 400
    object tb_produtoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_produtoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Size = 50
    end
    object tb_produtoQUANTIDADE_PRODUTO: TIntegerField
      FieldName = 'QUANTIDADE_PRODUTO'
      Origin = 'QUANTIDADE_PRODUTO'
    end
    object tb_produtoID_PESSOA_PROD: TIntegerField
      FieldName = 'ID_PESSOA_PROD'
      Origin = 'ID_PESSOA_PROD'
      Required = True
    end
    object tb_produtoVALOR_PRODUTO: TBCDField
      FieldName = 'VALOR_PRODUTO'
      Origin = 'VALOR_PRODUTO'
      Precision = 18
      Size = 2
    end
    object tb_produtoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Origin = 'TIPO_PRODUTO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_produto: TDataSource
    DataSet = sql_produto
    Left = 168
    Top = 472
  end
  object sql_produto: TFDQuery
    Connection = BDConnectionFB
    SQL.Strings = (
      'select * from produtos')
    Left = 168
    Top = 536
    object sql_produtoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sql_produtoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Size = 50
    end
    object sql_produtoQUANTIDADE_PRODUTO: TIntegerField
      FieldName = 'QUANTIDADE_PRODUTO'
      Origin = 'QUANTIDADE_PRODUTO'
    end
    object sql_produtoID_PESSOA_PROD: TIntegerField
      FieldName = 'ID_PESSOA_PROD'
      Origin = 'ID_PESSOA_PROD'
      Required = True
    end
    object sql_produtoVALOR_PRODUTO: TBCDField
      FieldName = 'VALOR_PRODUTO'
      Origin = 'VALOR_PRODUTO'
      Precision = 18
      Size = 2
    end
    object sql_produtoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Origin = 'TIPO_PRODUTO'
      FixedChar = True
      Size = 1
    end
  end
  object tb_pessoa: TFDTable
    IndexFieldNames = 'ID_PESSOA'
    Connection = BDConnectionFB
    UpdateOptions.UpdateTableName = 'PESSOAS'
    TableName = 'PESSOAS'
    Left = 248
    Top = 400
    object tb_pessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      Required = True
    end
    object tb_pessoaNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 50
    end
    object tb_pessoaDOCUMENTO_PESSOA: TStringField
      FieldName = 'DOCUMENTO_PESSOA'
      Origin = 'DOCUMENTO_PESSOA'
      Size = 50
    end
    object tb_pessoaFONE_PESSOA: TStringField
      FieldName = 'FONE_PESSOA'
      Origin = 'FONE_PESSOA'
      Size = 50
    end
    object tb_pessoaTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object tb_pessoaID_PAIS_PESSOA: TIntegerField
      FieldName = 'ID_PAIS_PESSOA'
      Origin = 'ID_PAIS_PESSOA'
    end
  end
  object ds_pessoa: TDataSource
    DataSet = sql_pessoa
    Left = 248
    Top = 472
  end
  object sql_pessoa: TFDQuery
    Connection = BDConnectionFB
    SQL.Strings = (
      'select * from pessoas')
    Left = 248
    Top = 536
    object sql_pessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sql_pessoaNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 50
    end
    object sql_pessoaDOCUMENTO_PESSOA: TStringField
      FieldName = 'DOCUMENTO_PESSOA'
      Origin = 'DOCUMENTO_PESSOA'
      Size = 50
    end
    object sql_pessoaFONE_PESSOA: TStringField
      FieldName = 'FONE_PESSOA'
      Origin = 'FONE_PESSOA'
      Size = 50
    end
    object sql_pessoaTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object sql_pessoaID_PAIS_PESSOA: TIntegerField
      FieldName = 'ID_PAIS_PESSOA'
      Origin = 'ID_PAIS_PESSOA'
    end
  end
end
