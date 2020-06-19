object FProdutos: TFProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tabela de Produtos'
  ClientHeight = 382
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblLocalizarUsuarios: TLabel
    Left = 8
    Top = 39
    Width = 45
    Height = 13
    Caption = 'Localizar:'
  end
  object EdtLocalizarProdutos: TEdit
    Left = 8
    Top = 58
    Width = 489
    Height = 21
    CharCase = ecUpperCase
    Color = clCream
    TabOrder = 0
    OnChange = EdtLocalizarProdutosChange
  end
  object G1Grid: TDBGrid
    Left = 8
    Top = 99
    Width = 489
    Height = 246
    Cursor = crHandPoint
    Color = clWhite
    DataSource = DM.ds_produto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = G1GridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Caption = 'ID'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Title.Caption = 'Produto'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_PRODUTO'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PESSOA_PROD'
        Title.Caption = 'Id Fornec'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PRODUTO'
        Title.Caption = '$ Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PRODUTO'
        Title.Caption = 'Tipo'
        Width = 96
        Visible = True
      end>
  end
  object PainelUsuarios1: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 33
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 6
  end
  object PainelUsuarios2: TPanel
    Left = 0
    Top = 364
    Width = 595
    Height = 18
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
  end
  object BtnIncluir: TBitBtn
    Left = 503
    Top = 107
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnIncluirClick
  end
  object BtnAlterar: TBitBtn
    Left = 503
    Top = 146
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = BtnAlterarClick
  end
  object BtnExcluir: TBitBtn
    Left = 503
    Top = 185
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BtnExcluirClick
  end
  object BtnSair: TButton
    Left = 503
    Top = 224
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 4
    OnClick = BtnSairClick
  end
end
