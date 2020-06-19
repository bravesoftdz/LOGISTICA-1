unit UCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFCadPessoas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnCancelar: TButton;
    BtnSalvar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EdtNomePessoa: TDBEdit;
    LkComboBoxPessoas: TDBLookupComboBox;
    LblUsuario: TLabel;
    edtTelefone: TDBEdit;
    Label3: TLabel;
    rdgTipoPessoa: TDBRadioGroup;
    EdtCpfCnpj: TMaskEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnCancelarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadPessoas: TFCadPessoas;

implementation

{$R *.dfm}

uses UDM, UUsuarios;

procedure TFCadPessoas.BtnCancelarClick(Sender: TObject); //procedimento ao clicar em cancelar
begin                                                     //inicie
    DM.sql_pessoa.Cancel;                                //cancelar o estado da tabela
    Close;                                                //fechar
end;                                                      //fimbegin

procedure TFCadPessoas.BtnCancelarKeyDown(Sender: TObject; var Key: Word; //procedimento bot�o ESC
  Shift: TShiftState);
begin                                                                     //inicie
    if key=VK_ESCAPE then                                                 //se a tecla ESC for pressionada ent�o
    BtnCancelar.Click;                                                    //btncancelarclick ser� acionado
end;                                                                      //fimbegin

procedure TFCadPessoas.BtnSalvarClick(Sender: TObject);
begin
  if EdtNomePessoa.Text = '' then
  begin
    ShowMessage('Nome n�o Informado!');
    EdtNomePessoa.SetFocus;
    Exit
  end;

  if EdtCpfCnpj.Text = '' then
  begin
    ShowMessage('Documento n�o Informada!');
    EdtCpfCnpj.SetFocus;
    Exit
  end;

  if DM.sql_pessoa.State=dsInsert then
  begin
    DM.sql_Gen_pessoa.Close;
    DM.sql_Gen_pessoa.Open;
    DM.sql_pessoaID_PESSOA.AsInteger       :=DM.sql_Gen_pessoaID.Value;
    DM.sql_pessoaNOME_PESSOA.AsString      :=EdtNomePessoa.Text;
    DM.sql_pessoaDOCUMENTO_PESSOA.AsString :=EdtCpfCnpj.Text;
    DM.sql_pessoaFONE_PESSOA.AsString      := edtTelefone.Text;
    DM.sql_pessoa.Post;
    ShowMessage('Pessoa cadastrada com sucesso!');
    DM.sql_pessoa.Refresh;
    Close;
  end;

  if DM.sql_pessoa.State=dsEdit then
  begin
    DM.sql_pessoaNOME_PESSOA.AsString      :=EdtNomePessoa.Text;
    DM.sql_pessoaDOCUMENTO_PESSOA.AsString :=EdtCpfCnpj.Text;
    DM.sql_pessoaFONE_PESSOA.AsString      := edtTelefone.Text;
    DM.sql_pessoa.Post;
    ShowMessage('Pessoa cadastrada com sucesso!');
    DM.sql_pessoa.Refresh;
    Close;
  end;


end;

procedure TFCadPessoas.BtnSalvarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
  BtnCancelar.Click;
end;

procedure TFCadPessoas.FormClose(Sender: TObject; var Action: TCloseAction);//procedimento ao fechar form
begin                                                                       //inicie
  if DM.sql_pessoa.State in [dsInsert,dsEdit] then
  DM.sql_pessoa.Cancel;                                                 //cancela qualquer opera��o na tabela
end;                                                                        //fim

procedure TFCadPessoas.FormCreate(Sender: TObject);
begin
  if DM.sql_pessoa.Params.ParamByName('TIPO_PESSOA').AsString = 'C' then
  begin
    Self.Caption:='Cadastro de Cliente';
    EdtCpfCnpj.EditMask :='999.999.999-99;0;_';
  end
  else
  begin
     Self.Caption:='Cadastro de Fornecedor';
     EdtCpfCnpj.EditMask :='99.999.999/9999-99;0;_';
  end;


   if not DM.sql_paises.Active then
   begin
     DM.sql_paises.Close;
     dm.sql_paises.Open;
   end;

   EdtCpfCnpj.Text := DM.sql_pessoaDOCUMENTO_PESSOA.AsString;

 end;

end.
