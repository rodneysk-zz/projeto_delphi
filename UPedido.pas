unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UDM, TelaBase, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Menus;

type
  TfPedido = class(TfTelaBase)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    edQuantidade: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedido: TfPedido;

implementation

{$R *.dfm}


procedure TfPedido.btNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit3.Text := DateToStr(Date());
end;

procedure TfPedido.FormShow(Sender: TObject);
begin
  inherited;
  DM.MPedidos.Open;
  DM.MCliente.Open;

  DM.MProduto.Open;
  DM.MVendas_Produtos.Open;
end;

procedure TfPedido.SpeedButton1Click(Sender: TObject);
var
idProduto,qtdProduto : integer;
begin
  inherited;
  idProduto := StrToInt(DBLookupComboBox2.KeyValue);
  if (DM.MPedidosidPedido.AsInteger > 0 ) then
  begin
   { DM.MProduto.First;
    while not DM.MProduto.eof do
    begin
       if (DM.MProdutoidProduto.AsInteger = idProduto) then
       begin
          if(DM.MProdutoqtdeEstoque.AsInteger > StrToInt(edQuantidade.Text)) then
          begin
            // dando baixa na quantidade estoque
            qtdProduto := DM.MProdutoqtdeEstoque.AsInteger - StrToInt(edQuantidade.Text) ;
            DM.QAux.Close;
            DM.QAux.SQL.Text := 'update produto set qtdeEstoque = '+ IntToStr(qtdProduto)  + ' where idProduto = ' +  IntToStr(idProduto);
            DM.QAux.ExecSQL;

            DM.MProduto.Close;
            DM.QProduto.Close;
            DM.QProduto.Open;
            DM.MProduto.Open;

          end
          else
          begin
            //se nao possuir quantidade suficiente
            ShowMessage('Quantidade de produtos indisponivel, a quantidade em estoque e = ' + DM.MProdutoqtdeEstoque.AsString);
            abort
          end;
       end;
       DM.MProduto.Next;
    end;   }

    DM.MVendas_Produtos.Append;
    DM.MVendas_ProdutosidProduto.AsInteger  :=  idProduto;
    DM.MVendas_ProdutosidPedido.AsInteger   :=  DM.MPedidosidPedido.AsInteger;
    DM.MVendas_Produtosquantida.AsInteger   :=  StrToInt(edQuantidade.Text);
    DM.MVendas_Produtos.Post;

    DM.MVendas_Produtos.Close;
    DM.QVendas_Produtos.Close;
    DM.QVendas_Produtos.Open;
    DM.MVendas_Produtos.Open;

    edQuantidade.Clear;
   end;
end;

procedure TfPedido.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja Realmente Excluir o Registro ?' , 'Exclusão' , MB_YESNO + MB_ICONWARNING ) = ID_YES then
      DM.MVendas_Produtos.Delete;
end;

Initialization
    RegisterClass(TfPedido);

Finalization
    RegisterClass(TfPedido);
end.
