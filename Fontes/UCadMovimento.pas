unit UCadMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFCadmovimento = class(TForm)
    P1: TPanel;
    P3: TPanel;
    P2: TPanel;
    StatusBar1: TStatusBar;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    dbgCompraVenda: TDBGrid;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnIncluir: TBitBtn;
    dtpData: TDateTimePicker;
    Label2: TLabel;
    lkCbxClienteFornecedor: TDBLookupComboBox;
    lblClienteFornecedor: TLabel;
    btnTabela: TBitBtn;
    lkCbxFormapagamento: TDBLookupComboBox;
    lblFormaPagamento: TLabel;
    lkCbxMeioTransporte: TDBLookupComboBox;
    lblMeiotransporte: TLabel;
    txtTotalitens: TDBText;
    pnTotal: TFlowPanel;
    pnQtd: TFlowPanel;
    txtQtd: TDBText;
    sql_ItensDelete: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadmovimento: TFCadmovimento;

implementation

uses
  UDM, UPessoas, UCadItens;

{$R *.dfm}

procedure TFCadmovimento.btnCancelarClick(Sender: TObject);
begin
  FCadmovimento:=nil;
  Close;
end;

procedure TFCadmovimento.btnIncluirClick(Sender: TObject);
begin
  if lkCbxClienteFornecedor.Text = '' then
  if Self.Caption='Compra' then
  begin
    ShowMessage('informe o Fornecedor');
    lkCbxClienteFornecedor.SetFocus;
    Exit;
  end;

  DM.sql_IncluirItens.Active:=True;
  DM.sql_IncluirItens.EmptyDataSet;
  DM.sql_IncluirItens.Insert;
  DM.CriarFormulario(TFCadItens,FCadItens);
end;

procedure TFCadmovimento.btnSalvarClick(Sender: TObject);
begin
  if dtpData.Date = 0 then
  begin
    ShowMessage('Informe a Data');
    dtpData.SetFocus;
    Exit;
  end;

   if lkCbxClienteFornecedor.Text = '' then
  begin
    ShowMessage('Informe o Fornecedor');
    lkCbxClienteFornecedor.SetFocus;
    Exit;
  end;

   if lkCbxFormapagamento.Text = '' then
  begin
    ShowMessage('Informe a Forma de Pagamento');
    lkCbxFormapagamento.SetFocus;
    Exit;
  end;

   if lkCbxMeioTransporte.Text = '' then
  begin
    ShowMessage('Informe o Meio de Transporte');
    lkCbxMeioTransporte.SetFocus;
    Exit;
  end;

  if DM.sql_MovInclusao.State=dsInsert then
  begin
    DM.sql_Gen__MovConsul.Close;
    DM.sql_Gen__MovConsul.Open;
    DM.sql_MovInclusaoID_MOVIMENTO.AsInteger := DM.sql_Gen__MovConsulID.AsInteger;
    if Self.Caption = 'Compra' then
    begin
      DM.sql_MovInclusaoTIPO_MOVIMENTO.AsString := 'C';
    end
    else
      DM.sql_MovInclusaoTIPO_MOVIMENTO.AsString := 'V';

    DM.sql_MovInclusaoDATA_MOVIMENTO.AsDateTime := dtpData.Date;
    dm.sql_MovInclusaoTOTAL_MOVIMENTO.AsFloat   := txtTotalitens.Field.Value;
    DM.sql_MovInclusaoID_PGTO_MOVIMENTO.AsInteger := dm.sql_formaspgtoID_FORMAPGTO.AsInteger;
    DM.sql_MovInclusaoID_TRANSPORTE_MOVIMENTO.AsInteger := dm.sql_meiotransporteID_TRANSPORTE.AsInteger;
    DM.sql_MovInclusao.Post;

    DM.sql_IncluirItensDBG.First;
    while not DM.sql_IncluirItensDBG.Eof do
    begin
      //verificando se o produto j� esta no banco de dados
      DM.sql_Itens.Close;
      DM.sql_Itens.Params[0].AsInteger := DM.sql_IncluirItensID_ITEM_MOVIMENTO.AsInteger;
      DM.sql_Itens.Open;
      //se n�o tiver vou acrescentar
      if DM.sql_Itens.IsEmpty then
      begin
        DM.sql_Itens.Append;
        {DM.sql_Itens.Close;
        DM.sql_Itens.Open;}
        DM.sql_ItensID_ITEM_MOVIMENTO.AsInteger :=DM.sql_Gen_ItemID.AsInteger;
      end
      else
      DM.sql_Itens.Edit;
      DM.sql_ItensID_MOVIMENTO_ITENS.AsInteger   := DM.sql_MovInclusaoID_MOVIMENTO.AsInteger;
      DM.sql_ItensID_PRODUTO_ITENS.AsInteger     := DM.sql_IncluirItensID_PRODUTO_ITENS.AsInteger;
      DM.sql_ItensQUANTIDADE_MOVIMENTO.AsInteger := DM.sql_IncluirItensQUANTIDADE_MOVIMENTO.AsInteger;
      DM.sql_ItensVALOR_MOVIMENTO.AsFloat        := DM.sql_IncluirItensVALOR_MOVIMENTO.AsFloat;
      DM.sql_ItensTOTAL_MOVIMENTO.AsFloat        := DM.sql_IncluirItensTOTAL_MOVIMENTO.AsFloat;
      //DM.sql_Itens.Post;
      DM.sql_IncluirItensDBG.Next;

    end;
    ShowMessage('Informa��es Armazenadas com Sucesso!');
    Close;

    //limpando a tabela de itens
    sql_ItensDelete.Close;
    sql_ItensDelete.SQL.Clear;
    sql_ItensDelete.SQL.Add('delete from itensmovimento');
    sql_ItensDelete.ExecSQL;
    sql_ItensDelete.SQL.Clear;

  end;

end;

procedure TFCadmovimento.btnTabelaClick(Sender: TObject);
begin
  DM.CriarFormulario(TFPessoas,FPessoas);
end;

procedure TFCadmovimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCadmovimento:= nil;
end;

procedure TFCadmovimento.FormCreate(Sender: TObject);
begin
  dtpData.Date:=Now;
  DM.sql_IncluirItens.close;

  dm.sql_pessoa.Close;

  if dm.sql_MovConsul.Params[2].AsString = 'C'  then
  begin
    Self.Caption:='Compra';
    lblClienteFornecedor.Caption:='Fornecedor';
     dm.sql_pessoa.Params.ParamByName('TIPO_PESSOA').AsString:='F';
  end
  else
  begin
    Self.Caption:= 'Venda';
    lblClienteFornecedor.Caption:= 'Cliente';
    dm.sql_pessoa.Params.ParamByName('TIPO_PESSOA').AsString:='C';
  end;
  DM.sql_pessoa.Params.ParamByName('NOME_PESSOA').AsString:='%';
  DM.sql_pessoa.Open;

  if not DM.sql_formaspgto.Active then
  begin
    DM.sql_formaspgto.Close;
    DM.sql_formaspgto.Open;
  end;

   if not DM.sql_meiotransporte.Active then
  begin
    DM.sql_meiotransporte.Close;
    DM.sql_meiotransporte.Open;
  end;

   if not DM.sql_pessoa.Active then
  begin
    DM.sql_pessoa.Close;
    DM.sql_pessoa.Open;
  end;

end;

end.