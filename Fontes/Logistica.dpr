program Logistica;

uses
  Vcl.Forms,
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  UCadPessoa in 'UCadPessoa.pas' {FCadPessoas},
  UDM in 'UDM.pas' {tb_pessoa: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UPessoas in 'UPessoas.pas' {FPessoas},
  UMeiosTransportes in 'UMeiosTransportes.pas' {FMeiosTransportes},
  UCadMeioTransporte in 'UCadMeioTransporte.pas' {FCadMeioTransporte},
  UPaises in 'UPaises.pas' {FPaises},
  UCadPaises in 'UCadPaises.pas' {FCadPaises},
  UCadFormasPgto in 'UCadFormasPgto.pas' {FCadFormasPgto},
  UFormasPgto in 'UFormasPgto.pas' {FFormasPgto},
  UUsuarios in 'UUsuarios.pas' {FUsuarios},
  UCadUsuario in 'UCadUsuario.pas' {FCadUsuarios},
  UProdutos in 'UProdutos.pas' {FProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFProdutos, FProdutos);
  Application.Run;
end.
