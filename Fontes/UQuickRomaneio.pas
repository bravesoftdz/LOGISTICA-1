unit UQuickRomaneio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFQuickRomaneio = class(TForm)
    qkRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    lbPessoa: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    qryPessoa: TFDQuery;
    qryPessoaNOME_PESSOA: TStringField;
    RLDraw1: TRLDraw;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLBand4: TRLBand;
    RLLabel12: TRLLabel;
    RLBand3: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBResult1: TRLDBResult;
    function NomePessoa(idPessoa: integer): string;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQuickRomaneio: TFQuickRomaneio;

implementation

uses
  UDM, UMovimentos;

{$R *.dfm}

procedure TFQuickRomaneio.FormCreate(Sender: TObject);
begin
  qkRelatorio.Preview;
end;

function TFQuickRomaneio.NomePessoa(idPessoa: integer): string;
begin
  qryPessoa.Close;
  qryPessoa.Params[0].AsInteger :=idpessoa;
  qryPessoa.Open;
  Result:=qryPessoaNOME_PESSOA.AsString;
  qryPessoa.Close;
end;

procedure TFQuickRomaneio.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if DM.sql_MovInclusaoTIPO_MOVIMENTO.AsString = 'Compra' then
  begin
    lbPessoa.Caption:='Fornecedor: ';
  end
  else lbPessoa.Caption := 'Cliente: ';
  lbPessoa.Caption := lbPessoa.Caption+NomePessoa(DM.sql_MovInclusaoID_PESSOA_MOVIMENTO.AsInteger);
end;

end.
