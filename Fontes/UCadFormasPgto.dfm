object FCadFormasPgto: TFCadFormasPgto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Formas de Pagamento'
  ClientHeight = 145
  ClientWidth = 206
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 206
    Height = 17
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 206
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 173
  end
  object BtnCancelar: TButton
    Left = 116
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BtnCancelarClick
    OnKeyDown = BtnCancelarKeyDown
  end
  object BtnSalvar: TButton
    Left = 11
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = BtnSalvarClick
    OnKeyDown = BtnSalvarKeyDown
  end
  object EdtDescricao: TDBEdit
    Left = 24
    Top = 48
    Width = 164
    Height = 21
    DataField = 'DESCRICAO_FORMAPGTO'
    DataSource = DM.ds_formaspgto
    TabOrder = 0
  end
end
