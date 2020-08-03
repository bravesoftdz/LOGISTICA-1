unit UPeriodoMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFPeriodoMovimentacao = class(TForm)
    pn2: TPanel;
    pn1: TPanel;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPeriodoMovimentacao: TFPeriodoMovimentacao;

implementation

uses
  UDM, UGrafico, UQuickMovimentacao;

{$R *.dfm}

procedure TFPeriodoMovimentacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPeriodoMovimentacao.btnVisualizarClick(Sender: TObject);
begin
  DM.sRelatmovimentacao.Close;
  DM.sRelatmovimentacao.Params[0].AsDate:=dtpInicial.Date;
  DM.sRelatmovimentacao.Params[1].AsDate:=dtpFinal.Date;
  DM.sRelatmovimentacao.Open;
  if dm.sRelatmovimentacao.IsEmpty then
  begin
    ShowMessage('nenhum movimento encontrado!!');

  end
  else
   Application.CreateForm(TFQuickMovimentacao,FQuickMovimentacao);
   FQuickMovimentacao.free;
   DM.sRelatmovimentacao.Close;

end;

procedure TFPeriodoMovimentacao.FormCreate(Sender: TObject);
begin
  dtpInicial.Date:=Now;
  dtpFinal.Date:=Now;
end;

end.
