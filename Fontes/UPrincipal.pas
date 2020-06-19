unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFPrincipal = class(TForm)
    Menu: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Produtos1: TMenuItem;
    Consulta1: TMenuItem;
    Vendas1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendas2: TMenuItem;
    Compras1: TMenuItem;
    Estoque1: TMenuItem;
    Financeiro1: TMenuItem;
    Caixa1: TMenuItem;
    Receitas1: TMenuItem;
    Despesas1: TMenuItem;
    Configuraes1: TMenuItem;
    Usurios1: TMenuItem;
    Sair1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Meiosdetransportes2: TMenuItem;
    Pases2: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Sair1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure Meiosdetransportes2Click(Sender: TObject);
    procedure Pases2Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UUsuarios, UDM, UProdutos, ULogin, UFormasPgto, UMeiosTransportes, UPaises, UPessoas;

procedure TFPrincipal.Clientes1Click(Sender: TObject);
begin
  DM.sql_pessoa.Close;
  dm.sql_pessoa.Params.ParamByName('TIPO_PESSOA').AsString:='C';
  Dm.CriarFormulario(TFPessoas ,FPessoas);
end;

procedure TFPrincipal.FormasdePagamento1Click(Sender: TObject);
begin
  Dm.CriarFormulario(TFFormasPgto,FFormasPgto);
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  FPrincipal := nil;
end;

procedure TFPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  Application.Terminate;
end;

procedure TFPrincipal.Meiosdetransportes2Click(Sender: TObject);
begin
  Dm.CriarFormulario(TFMeiosTransportes,FMeiosTransportes);
end;

procedure TFPrincipal.Pases2Click(Sender: TObject);
begin
  Dm.CriarFormulario(TFPaises,FPaises);
end;

procedure TFPrincipal.Produtos1Click(Sender: TObject);
begin
  Dm.CriarFormulario(TFProdutos,FProdutos);
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.Usurios1Click(Sender: TObject);
begin
  DM.CriarFormulario(TFUsuarios,FUsuarios);
end;

end.
