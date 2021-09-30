program Cadastro;

uses
  Vcl.Forms,
  UPricipal in 'UPricipal.pas' {fMenu},
  UDM in 'UDM.pas' {DM: TDataModule},
  TelaBase in 'TelaBase.pas' {fTelaBase},
  UCliente in 'UCliente.pas' {fCliente},
  ULogin in 'ULogin.pas' {fLogin},
  UTelas in 'UTelas.pas' {fTelas},
  UUsuarios in 'UUsuarios.pas' {fUsuarios},
  UProduto in 'UProduto.pas' {fProduto},
  UPedido in 'UPedido.pas' {fPedido},
  UEstoque in 'UEstoque.pas' {fEstoque},
  UFaturamento in 'UFaturamento.pas' {fFaturamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
