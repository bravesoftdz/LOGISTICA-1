unit UPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFPessoas = class(TForm)
    LblLocalizarUsuarios: TLabel;
    EdtLocalizarPessoas: TEdit;
    G1Grid: TDBGrid;
    PainelUsuarios1: TPanel;
    PainelUsuarios2: TPanel;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TButton;
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure G1GridDblClick(Sender: TObject);
    procedure EdtLocalizarPessoasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPessoas: TFPessoas;

implementation

{$R *.dfm}

uses UDM, UCadProduto, UCadPessoa;{units que podem ser acessadas e utilizadas}

procedure TFPessoas.FormCreate(Sender: TObject);//ao abrir tela de produtos
begin                                            //inicie
  {dm.cdsProdutos.Close;                        //fechar tabela
  dm.cdsProdutos.Open; }

  dm.sql_pessoa.Close;
  dm.sql_pessoa.Open;
   
end;

procedure TFPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_ESCAPE then //se a tecla ESC for pressionada ent�o
    Close;
end;

procedure TFPessoas.G1GridDblClick(Sender: TObject);
begin
  BtnAlterar.Click;
end;

//fim

procedure TFPessoas.BtnAlterarClick(Sender: TObject);
begin


  if not DM.sql_pessoa.IsEmpty then
  begin
  Self.Visible :=False;
  DM.sql_pessoa.Edit;
  dm.CriarFormulario(TFCadPessoas,FCadPessoas);
  Self.Visible:=True;
  end;


end;

procedure TFPessoas.BtnExcluirClick(Sender: TObject);
begin


    if not dm.sql_pessoa.IsEmpty then
    begin
        if dm.MessageDlgDefault('Confirmar a Exclus�o',mtInformation,[mbYes,mbNo],0)=mrYes  then
      //se ao informar a mensagem 'Confirmar a Exclus�o' for igual a Yes ent�o
        begin
            dm.sql_pessoa.Delete;
            ShowMessage('Informa��es Exclu�das com Sucesso!');
        end;

    end;


end;

procedure TFPessoas.BtnIncluirClick(Sender: TObject);
begin


    //Firebird
  Self.Visible :=False;
  DM.sql_pessoa.Active := True;
  DM.sql_pessoa.Insert;
  DM.sql_pessoaTIPO_PESSOA.AsString := DM.sql_pessoa.Params[0].AsString;
  dm.CriarFormulario(TFCadPessoas,FCadPessoas);
  Self.Visible:=True;





end;

procedure TFPessoas.BtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFPessoas.EdtLocalizarPessoasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
  begin
    DM.sql_pessoa.Close;
    DM.sql_pessoa.Params.ParamByName('NOME_PESSOA').AsString := EdtLocalizarPessoas.Text+'%';
    DM.sql_pessoa.Open;

  end;
end;

end.
