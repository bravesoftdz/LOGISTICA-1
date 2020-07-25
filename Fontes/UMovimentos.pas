unit UMovimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFMovimentos = class(TForm)
    dbgMovimentos: TDBGrid;
    PainelUsuarios1: TPanel;
    PainelUsuarios2: TPanel;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TButton;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnBuscarmov: TBitBtn;
    btnImprimirPedido: TBitBtn;
    sql_ItensDelete: TFDQuery;
    sql_ImprimirPedidos: TFDQuery;
    ds_ImprimirPedidos: TDataSource;
    sql_ImprimirPedidosID_ITEM_MOVIMENTO: TIntegerField;
    sql_ImprimirPedidosID_MOVIMENTO_ITENS: TIntegerField;
    sql_ImprimirPedidosID_PRODUTO_ITENS: TIntegerField;
    sql_ImprimirPedidosQUANTIDADE_MOVIMENTO: TIntegerField;
    sql_ImprimirPedidosVALOR_MOVIMENTO: TBCDField;
    sql_ImprimirPedidosTOTAL_MOVIMENTO: TBCDField;
    sql_ImprimirPedidosNOME_PRODUTO_ITENS: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure dbgMovimentosDblClick(Sender: TObject);
    procedure btnBuscarmovClick(Sender: TObject);
    procedure btnImprimirPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovimentos: TFMovimentos;

implementation

{$R *.dfm}

uses UDM, UCadMovimento, UQuickRomaneio;{units que podem ser acessadas e utilizadas}

procedure TFMovimentos.FormCreate(Sender: TObject);//ao abrir tela de produtos
begin                                            //inicie
  dtpInicial.Date:=Now;
  dtpFinal.Date:=Now;
  btnBuscarmov.Click;
   
end;

procedure TFMovimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_ESCAPE then //se a tecla ESC for pressionada ent�o
    Close;
end;

procedure TFMovimentos.dbgMovimentosDblClick(Sender: TObject);
begin
  BtnAlterar.Click;
end;

//fim

procedure TFMovimentos.btnImprimirPedidoClick(Sender: TObject);
begin
  DM.sql_MovInclusao.Close;
  DM.sql_MovInclusao.Params[0].AsInteger := DM.sql_MovConsulID_MOVIMENTO.AsInteger;
  dm.sql_MovInclusao.Open;

  {dm.sql_sItensArm.Close;
  dm.sql_sItensArm.Params[0].AsInteger := DM.sql_MovInclusaoID_MOVIMENTO.AsInteger;
  dm.sql_sItensArm.Open;}

   sql_ImprimirPedidos.Close;
   sql_ImprimirPedidos.SQL.Clear;
   sql_ImprimirPedidos.SQL.Add('select * from itensmovimentoarm');
   sql_ImprimirPedidos.SQL.Add('where id_movimento_itens = :idmovimentoitens');
   sql_ImprimirPedidos.ParamByName('idmovimentoitens').AsInteger := DM.sql_MovInclusaoID_MOVIMENTO.AsInteger;
   sql_ImprimirPedidos.Open;

  Application.CreateForm(TFQuickRomaneio,FQuickRomaneio);
  FQuickRomaneio.Free;
  DM.sql_MovInclusao.Close;
end;

procedure TFMovimentos.BtnAlterarClick(Sender: TObject);
begin
   //Firebird

   if DM.sql_MovConsul.IsEmpty then
   Exit;

  Self.Visible :=False;

  DM.sql_MovInclusao.Close;
  DM.sql_MovInclusao.Params[0].AsInteger := DM.sql_MovConsulID_MOVIMENTO.AsInteger;
  DM.sql_MovInclusao.Open;
  DM.sql_MovInclusao.Active:=True;
  DM.sql_MovInclusao.Edit;

  DM.sql_IncluirItensDBG.Close; //dm.cItens
  DM.sql_IncluirItensDBG.Open; //dm.cItens
  DM.sql_IncluirItensDBG.EmptyDataSet; //dm.cItens.EmptyDataSet;
  dm.CriarFormulario(TFCadmovimento,FCadmovimento);
  Self.Visible:=True;
end;

procedure TFMovimentos.btnBuscarmovClick(Sender: TObject);
begin
  DM.sql_MovConsul.Close;
  DM.sql_MovConsul.Params[0].AsDate:=dtpInicial.Date;
  DM.sql_MovConsul.Params[1].AsDate:=dtpFinal.Date;
  DM.sql_MovConsul.Open;
end;

procedure TFMovimentos.BtnExcluirClick(Sender: TObject);
begin
  if not dm.sql_MovConsul.IsEmpty then
  begin
    if dm.MessageDlgDefault('Confirmar a Exclus�o',mtInformation,[mbYes,mbNo],0)=mrYes  then
    //se ao informar a mensagem 'Confirmar a Exclus�o' for igual a Yes ent�o
    begin
      dm.sql_MovConsul.Delete;

      //deletando o mesmo item na itensmovimentoarm
      sql_ItensDelete.Close;
      sql_ItensDelete.SQL.Clear;
      sql_ItensDelete.SQL.Add('delete from itensmovimentoarm');
      sql_ItensDelete.SQL.Add('where id_movimento_itens = :idmovimentoitens ');
      sql_ItensDelete.ParamByName('idmovimentoitens').AsInteger := DM.sql_MovInclusaoID_MOVIMENTO.AsInteger;
      sql_ItensDelete.ExecSQL;
      sql_ItensDelete.SQL.Clear;
      dm.sql_IncluirItensDBG.close;
      dm.sql_IncluirItensDBG.open;




      ShowMessage('Informa��es Exclu�das com Sucesso!');
      dm.sql_MovConsul.close;
      dm.sql_MovConsul.open;
    end;
  end;
end;

procedure TFMovimentos.BtnIncluirClick(Sender: TObject);
begin
  //Firebird
  Self.Visible :=False;

  DM.sql_MovInclusao.Close;
 {passando o valor de -1 para o parametro id_movimento do sql_movinclusao,
  for�ando o sql abrir vazio.}
  DM.sql_MovInclusao.Params[0].AsInteger := -1;
  DM.sql_MovInclusao.Open;
  DM.sql_MovInclusao.Active:=True;
  DM.sql_MovInclusao.Insert;

  DM.sql_IncluirItensDBG.Close;
  DM.sql_IncluirItensDBG.Open;
  DM.sql_IncluirItensDBG.EmptyDataSet;
  dm.CriarFormulario(TFCadmovimento,FCadmovimento);
  Self.Visible:=True;
end;

procedure TFMovimentos.BtnSairClick(Sender: TObject);
begin
  FMovimentos:=nil;
  Close;
end;

end.
