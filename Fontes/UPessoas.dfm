object FPessoas: TFPessoas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Pessoas'
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
  object EdtLocalizarPessoas: TEdit
    Left = 8
    Top = 58
    Width = 489
    Height = 21
    CharCase = ecUpperCase
    Color = clCream
    TabOrder = 0
    OnKeyPress = EdtLocalizarPessoasKeyPress
  end
  object G1Grid: TDBGrid
    Left = 8
    Top = 99
    Width = 489
    Height = 246
    Cursor = crHandPoint
    Color = clWhite
    DataSource = DM.ds_pessoa
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
        FieldName = 'ID_PESSOA'
        Title.Caption = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PESSOA'
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCUMENTO_PESSOA'
        Title.Caption = 'Documento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE_PESSOA'
        Title.Caption = 'Fone'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PESSOA'
        Title.Caption = 'Tipo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PAIS_PESSOA'
        Title.Caption = 'ID Pais'
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