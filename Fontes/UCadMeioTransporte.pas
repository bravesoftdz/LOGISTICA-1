unit UCadMeioTransporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFCadMeioTransporte = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnCancelar: TButton;
    BtnSalvar: TButton;
    Label1: TLabel;
    EdtDescricao: TDBEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnCancelarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadMeioTransporte: TFCadMeioTransporte;

implementation

{$R *.dfm}

uses UDM, UUsuarios;

procedure TFCadMeioTransporte.BtnCancelarClick(Sender: TObject); //procedimento ao clicar em cancelar
begin                                                     //inicie
    dm.sql_meiotransporte.Cancel;                                //cancelar o estado da tabela
    Close;                                                //fechar
end;                                                      //fimbegin

procedure TFCadMeioTransporte.BtnCancelarKeyDown(Sender: TObject; var Key: Word; //procedimento bot�o ESC
  Shift: TShiftState);
begin                                                                     //inicie
    if key=VK_ESCAPE then                                                 //se a tecla ESC for pressionada ent�o
    BtnCancelar.Click;                                                    //btncancelarclick ser� acionado
end;                                                                      //fimbegin

procedure TFCadMeioTransporte.BtnSalvarClick(Sender: TObject);
begin

  //--

   if EdtDescricao.Text = '' then
  begin
    ShowMessage('Descri��o n�o Informado!');
    Edtdescricao.SetFocus;
    Exit
  end;



  if DM.sql_meiotransporte.State=dsInsert then
  begin
    DM.sql_Gen_meiotransporte.Close;
    DM.sql_Gen_meiotransporte.Open;
    DM.sql_meiotransporteID_TRANSPORTE.AsInteger :=DM.sql_Gen_meiotransporteID.Value;
    dm.sql_meiotransporteDESCRICAO_TRANSPORTE.AsString       :=EdtDescricao.Text;
    DM.sql_meiotransporte.Post;
    ShowMessage('Meio de Transporte cadastrado com sucesso!');
    DM.sql_meiotransporte.Refresh;
    Close;
  end;

  if DM.sql_meiotransporte.State=dsEdit then
  begin
    dm.sql_meiotransporteDESCRICAO_TRANSPORTE.AsString   :=EdtDescricao.Text;
    DM.sql_meiotransporte.Post;
    ShowMessage('Meio de Transporte alterado com sucesso!');
    DM.sql_meiotransporte.Refresh;
    Close;
  end;

end;

procedure TFCadMeioTransporte.BtnSalvarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
  BtnCancelar.Click;
end;

procedure TFCadMeioTransporte.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  BtnSalvar.Click;
end;

procedure TFCadMeioTransporte.FormClose(Sender: TObject; var Action: TCloseAction);//procedimento ao fechar form
begin                                                                       //inicie
  {if dm.cdsUsuarios.State in [dsInsert,dsEdit] then                       //se minha tabela usuarios estiver com status insert ou edit ent�o
  dm.cdsUsuarios.Cancel;}
  if DM.sql_meiotransporte.State in [dsInsert,dsEdit] then
  DM.sql_meiotransporte.Cancel;                                                  //cancela qualquer opera��o na tabela
end;                                                                        //fim

procedure TFCadMeioTransporte.FormCreate(Sender: TObject);
begin
  //EdtDescricao.SetFocus;
end;

end.
