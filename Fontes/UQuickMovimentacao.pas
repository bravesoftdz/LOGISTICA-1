unit UQuickMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFQuickMovimentacao = class(TForm)
    qkRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand2: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    Sumario: TRLBand;
    RLLabel12: TRLLabel;
    Subdetail: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    lblSaldo: TRLLabel;
    RLLabel4: TRLLabel;
    lblTipo: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure SubdetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure SumarioBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }

    vSaldo : Double;
  public
    { Public declarations }
  end;

var
  FQuickMovimentacao: TFQuickMovimentacao;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFQuickMovimentacao.FormCreate(Sender: TObject);
begin
  vSaldo:=0;
  qkRelatorio.Preview;
end;

procedure TFQuickMovimentacao.SubdetailBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (DM.sRelatmovimentacaoTIPO_MOVIMENTO.AsString = 'Compra') or (DM.sRelatmovimentacaoTIPO_MOVIMENTO.AsString='D')  then
  begin
    lblTipo.Font.Color:=clRed;
    vSaldo :=vSaldo-DM.sRelatmovimentacaoTOTAL_MOVIMENTO.AsFloat;
  end
  else
  begin
    lblTipo.Font.Color:=clGreen;
    vSaldo :=vSaldo+DM.sRelatmovimentacaoTOTAL_MOVIMENTO.AsFloat;
  end;



end;

procedure TFQuickMovimentacao.SumarioBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if vSaldo >= 0 then
  begin
    lblSaldo.Font.Color:=clGreen;
    lblSaldo.Caption:= 'Saldo>> R$ ' +FloatToStr(vSaldo) ;
  end
  else
    lblSaldo.Font.Color:=clRed;
    lblSaldo.Caption:= 'Saldo>> R$ ' +FloatToStr(vSaldo) ;


end;

end.
