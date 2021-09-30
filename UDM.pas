unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.Provider,
  Datasnap.DBClient;

type
  TDM = class(TDataModule)
    Connection: TADOConnection;
    QCliente: TADOQuery;
    MCliente: TClientDataSet;
    PCliente: TDataSetProvider;
    QCidade: TADOQuery;
    PCidade: TDataSetProvider;
    MCidade: TClientDataSet;
    DSCidade: TDataSource;
    PUsuario: TDataSetProvider;
    QTelas: TADOQuery;
    QTelasidTela: TAutoIncField;
    QTelasdescricao: TStringField;
    QTelasnomeTela: TStringField;
    PTelas: TDataSetProvider;
    MTelas: TClientDataSet;
    MTelasidTela: TAutoIncField;
    MTelasdescricao: TStringField;
    MTelasnomeTela: TStringField;
    QUsuario_Telas: TADOQuery;
    PUsuario_Telas: TDataSetProvider;
    MUsuario_Telas: TClientDataSet;
    DSUsuario_Telas: TDataSource;
    DSTelas: TDataSource;
    MUsuario: TClientDataSet;
    QUsuario: TADOQuery;
    MUsuarioidUsuario: TAutoIncField;
    MUsuarionome: TStringField;
    MUsuariosenha: TStringField;
    MUsuario_Telasid: TAutoIncField;
    MUsuario_TelasidTela: TIntegerField;
    MUsuario_TelasidUsuario: TIntegerField;
    MUsuario_Telasinserir: TBooleanField;
    MUsuario_Telasalterar: TBooleanField;
    MUsuario_Telasexcluir: TBooleanField;
    MUsuario_Telasimprimir: TBooleanField;
    QLogin: TADOQuery;
    QUsuario_Telasid: TAutoIncField;
    QUsuario_TelasidTela: TIntegerField;
    QUsuario_TelasidUsuario: TIntegerField;
    QUsuario_Telasinserir: TBooleanField;
    QUsuario_Telasalterar: TBooleanField;
    QUsuario_Telasexcluir: TBooleanField;
    QUsuario_Telasimprimir: TBooleanField;
    MCidadeidCidade: TAutoIncField;
    MCidadecidade: TWideStringField;
    MClienteidCliente: TAutoIncField;
    MClientenomeCliente: TWideStringField;
    MClientecnpj: TWideStringField;
    MClientedtNascimento: TDateTimeField;
    MClienteidCidade: TIntegerField;
    MClienteendereco: TWideStringField;
    MClientecep: TWideStringField;
    MClientenumero: TIntegerField;
    MClientecomplemento: TWideStringField;
    MClienteemail: TWideStringField;
    QProduto: TADOQuery;
    PProduto: TDataSetProvider;
    MProduto: TClientDataSet;
    MProdutoidProduto: TAutoIncField;
    MProdutoproduto: TWideStringField;
    MProdutovalor: TFloatField;
    MProdutoqtdeEstoque: TIntegerField;
    MProdutocodigoBarras: TWideStringField;
    DSProdutos: TDataSource;
    DSCliente: TDataSource;
    QPedidos: TADOQuery;
    QPedidosidPedido: TAutoIncField;
    QPedidosidCliente: TIntegerField;
    QPedidosdtCadastro: TDateField;
    QPedidosdtPrevistaEntrega: TDateField;
    PPedidos: TDataSetProvider;
    MPedidos: TClientDataSet;
    MPedidosidPedido: TAutoIncField;
    MPedidosidCliente: TIntegerField;
    MPedidosdtCadastro: TDateField;
    MPedidosdtPrevistaEntrega: TDateField;
    QVendas_Produtos: TADOQuery;
    PVendas_Produtos: TDataSetProvider;
    MVendas_Produtos: TClientDataSet;
    DSVendas_Produtos: TDataSource;
    MVendas_ProdutosidVenda: TAutoIncField;
    MVendas_ProdutosidProduto: TIntegerField;
    MVendas_ProdutosidPedido: TIntegerField;
    MVendas_Produtosquantida: TIntegerField;
    QAux: TADOQuery;
    QFaturamento: TADOQuery;
    PFaturamento: TDataSetProvider;
    MFaturamento: TClientDataSet;
    MFaturamentoidFaturamento: TIntegerField;
    MFaturamentodataFaturamento: TDateField;
    MFaturamentoidCliente: TIntegerField;
    QClienteFat: TADOQuery;
    PClienteFat: TDataSetProvider;
    MClienteFat: TClientDataSet;
    DSClienteFat: TDataSource;
    MClienteFatidCliente: TAutoIncField;
    MClienteFatnomeCliente: TWideStringField;
    MFaturamentonomeCliente: TWideStringField;
    QPedidosnomeCliente: TWideStringField;
    MPedidosnomeCliente: TWideStringField;
    QFaturamentoidFaturamento: TIntegerField;
    QFaturamentodataFaturamento: TDateField;
    QFaturamentoidCliente: TIntegerField;
    QFaturamentonomeCliente: TWideStringField;
    QProdutoFat: TADOQuery;
    PProdutoFat: TDataSetProvider;
    MProdutoFat: TClientDataSet;
    DSProdutoFat: TDataSource;
    MProdutoFatidVenda: TAutoIncField;
    MProdutoFatidPedido: TIntegerField;
    MProdutoFatquantida: TIntegerField;
    MProdutoFatidProduto: TIntegerField;
    MProdutoFatvalor: TFloatField;
    MProdutoFatqtdeEstoque: TIntegerField;
    MProdutoFatproduto: TWideStringField;
    QProdutoFatidVenda: TAutoIncField;
    QProdutoFatidPedido: TIntegerField;
    QProdutoFatquantida: TIntegerField;
    QProdutoFatidProduto: TIntegerField;
    QProdutoFatvalor: TFloatField;
    QProdutoFatqtdeEstoque: TIntegerField;
    QProdutoFatproduto: TWideStringField;
    PFaturamento_Item: TDataSetProvider;
    MFaturamento_item: TClientDataSet;
    DSFaturamento_Item: TDataSource;
    QFaturamento_Item: TADOQuery;
    MFaturamento_itemidFaturamentoItem: TAutoIncField;
    MFaturamento_itemidFaturamento: TIntegerField;
    MFaturamento_itemidProduto: TIntegerField;
    MFaturamento_itemidPedido: TIntegerField;
    QUsuario_Telasdescricao: TStringField;
    QUsuario_Telasnome: TStringField;
    MUsuario_Telasdescricao: TStringField;
    MUsuario_Telasnome: TStringField;
    MVendas_Produtosproduto: TWideStringField;
    MVendas_Produtosvalor: TFloatField;
    MVendas_ProdutosdtPrevistaEntrega: TDateField;
    MVendas_ProdutosnomeCliente: TWideStringField;
    MVendas_Produtostotal: TFloatField;
    procedure MClienteAfterPost(DataSet: TDataSet);
    procedure MClienteAfterDelete(DataSet: TDataSet);
    procedure MClienteAfterCancel(DataSet: TDataSet);
    procedure MTelasAfterCancel(DataSet: TDataSet);
    procedure MTelasAfterDelete(DataSet: TDataSet);
    procedure MTelasAfterPost(DataSet: TDataSet);
    procedure MUsuario_TelasAfterCancel(DataSet: TDataSet);
    procedure MUsuario_TelasAfterPost(DataSet: TDataSet);
    procedure MUsuario_TelasAfterDelete(DataSet: TDataSet);
    procedure QUsuario_TelasBeforeOpen(DataSet: TDataSet);
    procedure MUsuarioAfterCancel(DataSet: TDataSet);
    procedure MUsuarioAfterDelete(DataSet: TDataSet);
    procedure MUsuarioAfterPost(DataSet: TDataSet);
    procedure MUsuarioAfterScroll(DataSet: TDataSet);
    procedure MUsuarioBeforeDelete(DataSet: TDataSet);
    procedure MProdutoAfterCancel(DataSet: TDataSet);
    procedure MProdutoAfterDelete(DataSet: TDataSet);
    procedure MProdutoAfterPost(DataSet: TDataSet);
    procedure MPedidosAfterCancel(DataSet: TDataSet);
    procedure MPedidosAfterPost(DataSet: TDataSet);
    procedure MPedidosAfterDelete(DataSet: TDataSet);
    procedure MPedidosAfterScroll(DataSet: TDataSet);
    procedure MPedidosBeforeDelete(DataSet: TDataSet);
    procedure MVendas_ProdutosAfterCancel(DataSet: TDataSet);
    procedure MVendas_ProdutosAfterPost(DataSet: TDataSet);
    procedure MVendas_ProdutosAfterDelete(DataSet: TDataSet);
    procedure QVendas_ProdutosBeforeOpen(DataSet: TDataSet);
    procedure MFaturamentoAfterCancel(DataSet: TDataSet);
    procedure MFaturamentoAfterDelete(DataSet: TDataSet);
    procedure MFaturamentoAfterPost(DataSet: TDataSet);
    procedure QProdutoFatBeforeOpen(DataSet: TDataSet);
    procedure QFaturamento_ItemBeforeOpen(DataSet: TDataSet);
    procedure MFaturamento_itemAfterCancel(DataSet: TDataSet);
    procedure MFaturamento_itemAfterDelete(DataSet: TDataSet);
    procedure MFaturamento_itemAfterPost(DataSet: TDataSet);
    procedure MFaturamentoAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TDM.MClienteAfterCancel(DataSet: TDataSet);
begin
     MCliente.CancelUpdates;
end;

procedure TDM.MClienteAfterDelete(DataSet: TDataSet);
begin
     MCliente.ApplyUpdates(-1);
end;

procedure TDM.MClienteAfterPost(DataSet: TDataSet);
begin
     MCliente.ApplyUpdates(-1);
end;

procedure TDM.MFaturamentoAfterCancel(DataSet: TDataSet);
begin
  MFaturamento.CancelUpdates;
end;

procedure TDM.MFaturamentoAfterDelete(DataSet: TDataSet);
begin
  MFaturamento.ApplyUpdates(-1);
end;

procedure TDM.MFaturamentoAfterPost(DataSet: TDataSet);
begin
  MFaturamento.ApplyUpdates(-1);
end;

procedure TDM.MFaturamentoAfterScroll(DataSet: TDataSet);
begin
  MFaturamento_Item.Close;
  QFaturamento_item.Close;
  QFaturamento_Item.Open;
  MFaturamento_item.Open;
end;

procedure TDM.MFaturamento_itemAfterCancel(DataSet: TDataSet);
begin
  MFaturamento_item.CancelUpdates;
end;

procedure TDM.MFaturamento_itemAfterDelete(DataSet: TDataSet);
begin
  MFaturamento_item.ApplyUpdates(-1);
end;

procedure TDM.MFaturamento_itemAfterPost(DataSet: TDataSet);
begin
  MFaturamento_item.ApplyUpdates(-1);
end;

procedure TDM.MPedidosAfterScroll(DataSet: TDataSet);
begin
    MVendas_Produtos.Close;
    QVendas_Produtos.Close;
    QVendas_Produtos.Open;
    MVendas_Produtos.Open;
end;

procedure TDM.MPedidosBeforeDelete(DataSet: TDataSet);
begin
    MVendas_Produtos.First;
    while not MVendas_Produtos.Eof do
        MVendas_Produtos.Delete;
end;

procedure TDM.MPedidosAfterCancel(DataSet: TDataSet);
begin
  MPedidos.CancelUpdates;
end;

procedure TDM.MPedidosAfterDelete(DataSet: TDataSet);
begin
  MPedidos.ApplyUpdates(-1);
end;

procedure TDM.MPedidosAfterPost(DataSet: TDataSet);
begin
  MPedidos.ApplyUpdates(-1);
end;

procedure TDM.MProdutoAfterCancel(DataSet: TDataSet);
begin
  MProduto.CancelUpdates;
end;

procedure TDM.MProdutoAfterDelete(DataSet: TDataSet);
begin
    MProduto.ApplyUpdates(-1);
end;

procedure TDM.MProdutoAfterPost(DataSet: TDataSet);
begin
    MProduto.ApplyUpdates(-1);
end;

procedure TDM.MTelasAfterCancel(DataSet: TDataSet);
begin
     MTelas.CancelUpdates;
end;

procedure TDM.MTelasAfterDelete(DataSet: TDataSet);
begin
    MTelas.ApplyUpdates(-1);
end;


procedure TDM.MTelasAfterPost(DataSet: TDataSet);
begin
    MTelas.ApplyUpdates(-1);
end;

procedure TDM.MUsuarioAfterCancel(DataSet: TDataSet);
begin
    MUsuario.CancelUpdates;
end;

procedure TDM.MUsuarioAfterDelete(DataSet: TDataSet);
begin
    MUsuario.ApplyUpdates(-1);
end;

procedure TDM.MUsuarioAfterPost(DataSet: TDataSet);
begin
   MUsuario.ApplyUpdates(-1);
end;

procedure TDM.MUsuarioAfterScroll(DataSet: TDataSet);
begin
    MUsuario_Telas.Close;
    QUsuario_Telas.Close;
    QUsuario_Telas.Open;
    MUsuario_Telas.Open;
end;

procedure TDM.MUsuarioBeforeDelete(DataSet: TDataSet);
begin
    MUsuario_Telas.First;
    while not MUsuario_Telas.Eof do
        MUsuario_Telas.Delete;
end;

procedure TDM.MUsuario_TelasAfterCancel(DataSet: TDataSet);
begin
    MUsuario_Telas.CancelUpdates;
end;

procedure TDM.MUsuario_TelasAfterDelete(DataSet: TDataSet);
begin
  MUsuario_Telas.ApplyUpdates(-1);
end;

procedure TDM.MUsuario_TelasAfterPost(DataSet: TDataSet);
begin
  MUsuario_Telas.ApplyUpdates(-1);
end;


procedure TDM.MVendas_ProdutosAfterCancel(DataSet: TDataSet);
begin
  MVendas_Produtos.CancelUpdates;
end;

procedure TDM.MVendas_ProdutosAfterDelete(DataSet: TDataSet);
begin
  MVendas_Produtos.ApplyUpdates(-1);
end;

procedure TDM.MVendas_ProdutosAfterPost(DataSet: TDataSet);
begin
  MVendas_Produtos.ApplyUpdates(-1);
end;

procedure TDM.QFaturamento_ItemBeforeOpen(DataSet: TDataSet);
begin
  QFaturamento_Item.Parameters[0].Value := MFaturamentoidFaturamento.asInteger;
end;

procedure TDM.QProdutoFatBeforeOpen(DataSet: TDataSet);
begin
  QProdutoFat.Parameters[0].Value := MFaturamentoidCliente.AsInteger;
end;

procedure TDM.QUsuario_TelasBeforeOpen(DataSet: TDataSet);
begin
  QUsuario_Telas.Parameters[0].Value := MUsuarioidUsuario.AsInteger;
end;

procedure TDM.QVendas_ProdutosBeforeOpen(DataSet: TDataSet);
begin
  QVendas_Produtos.Parameters[0].Value := MPedidosidPedido.AsInteger;
end;

end.
