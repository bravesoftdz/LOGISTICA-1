unit UMovimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

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
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure dbgMovimentosDblClick(Sender: TObject);
    procedure btnBuscarmovClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovimentos: TFMovimentos;

implementation

{$R *.dfm}

uses UDM, UCadProduto;{units que podem ser acessadas e utilizadas}

procedure TFMovimentos.FormCreate(Sender: TObject);//ao abrir tela de produtos
begin                                            //inicie
  {dm.cdsProdutos.Close;                        //fechar tabela
  dm.cdsProdutos.Open; }

  dm.sql_produto.Close;
  dm.sql_produto.Open;
   
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

procedure TFMovimentos.BtnAlterarClick(Sender: TObject);
begin
    {if not dm.cdsProdutos.IsEmpty then                //se n�o estiver vazio ent�o
    begin                                             //inicie
    Self.Visible:=False;                              //esconde formulario UUsuario
    dm.cdsProdutos.Edit;
                                   //editar cadastro de usu�rios
    dm.CriarFormulario(TFCadProduto,FCadProduto);     //criar form
    Self.Visible:=True;                               //mostrar formulario UUsuario
    end; }

  if not DM.sql_produto.IsEmpty then
  begin
  Self.Visible :=False;
  DM.sql_produto.Edit;
  dm.CriarFormulario(TFCadProduto,FCadProduto);
  Self.Visible:=True;
  end;


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
    {if not dm.cdsProdutos.IsEmpty then                  //se n�o estiver vazio ent�o
    begin                                             //inicie
        if MessageDlg('Confirmar a Exclus�o',mtInformation,[mbYes,mbNo],0)=mrYes  then
     //se ao informar a mensagem 'Confirmar a Exclus�o' for igual a Yes ent�o
        begin                                         //inicie
            dm.cdsProdutos.Delete;                    //delete o registro na tabela usuario
            dm.cdsProdutos.ApplyUpdates(0);           //aplicar modifica��es na tabela
            ShowMessage('Informa��es Exclu�das com Sucesso!'); //exibir mensagem
        end;                                          //fimse

    end; }

    if not dm.sql_produto.IsEmpty then
    begin
        if dm.MessageDlgDefault('Confirmar a Exclus�o',mtInformation,[mbYes,mbNo],0)=mrYes  then
      //se ao informar a mensagem 'Confirmar a Exclus�o' for igual a Yes ent�o
        begin
            dm.sql_produto.Delete;
            ShowMessage('Informa��es Exclu�das com Sucesso!');
        end;

    end;


end;

procedure TFMovimentos.BtnIncluirClick(Sender: TObject);//incluir produto
begin                                                 //inicie
    {Self.Visible :=False;                             //esconde formulario UProduto
    dm.cdsProdutos.Append;                            //acrescentar em uma nova linha
    dm.cdsProdutosQUANTIDADE.AsFloat:=0;              //campo QUANTIDADE iniciar com 0
    dm.cdsProdutosVALOR.AsFloat:=0;                   //campo VALOR iniciar com 0
    dm.cdsProdutosTIPO.AsString:='T';                 //campo TIPO iniciar com T
    dm.CriarFormulario(TFCadProduto,FCadProduto);     //chamar procedimento para criar/abrir formulario UCadUProduto
    Self.Visible:=True;  }                             //mostrar formulario UProduto

    //Firebird
  Self.Visible :=False;
  DM.sql_produto.Active := True;
  DM.sql_produto.Insert;
  dm.CriarFormulario(TFCadProduto,FCadProduto);
  Self.Visible:=True;





end;

procedure TFMovimentos.BtnSairClick(Sender: TObject);//clique bot�o sair
begin                                              //inicie
    Close;                                         //fechar tela
end;                                               //fim

end.
