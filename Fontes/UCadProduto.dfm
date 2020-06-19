object FCadProduto: TFCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produto'
  ClientHeight = 229
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 29
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LblQtd: TLabel
    Left = 15
    Top = 78
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object LblTipo: TLabel
    Left = 122
    Top = 78
    Width = 24
    Height = 13
    Caption = 'Tipo:'
  end
  object LblValor: TLabel
    Left = 236
    Top = 78
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object LblFornecedor: TLabel
    Left = 15
    Top = 130
    Width = 59
    Height = 13
    Caption = 'Fornecedor:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 17
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 7
  end
  object Panel2: TPanel
    Left = 0
    Top = 188
    Width = 352
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 8
  end
  object BtnCancelar: TButton
    Left = 213
    Top = 196
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = BtnCancelarClick
  end
  object BtnSalvar: TButton
    Left = 54
    Top = 196
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = BtnSalvarClick
  end
  object CbTipo: TComboBox
    Left = 122
    Top = 97
    Width = 97
    Height = 21
    Cursor = crHandPoint
    Style = csDropDownList
    ItemIndex = 2
    TabOrder = 2
    Text = 'Todos'
    OnClick = CbTipoClick
    Items.Strings = (
      'Compra'
      'Venda'
      'Todos')
  end
  object LkFornecedor: TDBLookupComboBox
    Left = 15
    Top = 149
    Width = 204
    Height = 21
    KeyField = 'ID_PESSOA'
    ListField = 'NOME_PESSOA'
    ListSource = DM.ds_pessoa
    TabOrder = 4
  end
  object EdtValor: TDBEdit
    Left = 236
    Top = 95
    Width = 89
    Height = 21
    DataField = 'VALOR_PRODUTO'
    DataSource = DM.ds_produto
    TabOrder = 3
  end
  object EdtQtd: TDBEdit
    Left = 12
    Top = 95
    Width = 89
    Height = 21
    DataField = 'QUANTIDADE_PRODUTO'
    DataSource = DM.ds_produto
    TabOrder = 1
  end
  object EdtNome: TDBEdit
    Left = 15
    Top = 46
    Width = 194
    Height = 21
    DataField = 'NOME_PRODUTO'
    DataSource = DM.ds_produto
    TabOrder = 0
  end
end
