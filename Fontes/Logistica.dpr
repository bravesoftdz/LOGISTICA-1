program Logistica;

uses
  Vcl.Forms,
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  UCadUsuario in 'UCadUsuario.pas' {FCadUsuarios},
  UDM in 'UDM.pas' {tb_pessoa: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UProdutos in 'UProdutos.pas' {FProdutos},
  UUsuarios in 'UUsuarios.pas' {FUsuarios},
  UMeiosTransportes in 'UMeiosTransportes.pas' {FMeiosTransportes},
  UCadMeioTransporte in 'UCadMeioTransporte.pas' {FCadMeioTransporte},
  UPaises in 'UPaises.pas' {FPaises},
  UCadPaises in 'UCadPaises.pas' {FCadPaises},
  UCadFormasPgto in 'UCadFormasPgto.pas' {FCadFormasPgto},
  UFormasPgto in 'UFormasPgto.pas' {FFormasPgto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
