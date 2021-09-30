unit UEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, UDM;

type
  TfEstoque = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edCodigo: TLabeledEdit;
    edQuantidade: TLabeledEdit;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstoque: TfEstoque;

implementation

{$R *.dfm}

procedure TfEstoque.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
i,qtdProduto : integer;
begin
 if key = #13 then   //se pressionar a tecla enter
 begin
    if (edQuantidade.Text = '') then //Verifica se o campo "quantidade" foi preenchido
    begin
       Messagedlg('Por favor, informe a Quantidade!', mtInformation, [mbOk], 0);
          if edQuantidade.CanFocus then
             edQuantidade.SetFocus;
          Exit;
    end;
    i:= 0;
    DM.MProduto.First;
    while not DM.MProduto.eof do
    begin
        if (Trim(DM.MProdutocodigoBarras.AsString) = edCodigo.Text) then
        begin
          i := 1;
          //UPDATE NA QUANTIDADE PRODUTO
          qtdProduto := DM.MProdutoqtdeEstoque.AsInteger + StrToInt(edQuantidade.Text) ;
          DM.QAux.Close;
          DM.QAux.SQL.Text := 'update produto set qtdeEstoque = '+ IntToStr(qtdProduto)  + ' where idProduto = ' +  IntToStr(DM.MProdutoidProduto.AsInteger);
          DM.QAux.ExecSQL;
          ShowMessage('Produto: ' + Trim(DM.MProdutoproduto.AsString) + '. Nova Quantidade total em estoque:' + IntToStr(qtdProduto));

          //inserindo na tabela EntradaEstoque
          DM.QAux.Close;
          DM.QAux.SQL.Text := 'insert into entradasestoque (idProduto, dataEntrada, quantidade) VALUES ' +
                            '(' + IntToStr(DM.MProdutoidProduto.AsInteger) + ',''' + DateToStr(Date()) + ''',' + edQuantidade.Text + ')';
          DM.QAux.ExecSQL;

         end ;
      DM.MProduto.Next;
    end;

    if (i = 0) then
     ShowMessage('Código de barras inválido!');

     DM.MProduto.Close;
     DM.QProduto.Close;
     DM.QProduto.Open;
     DM.MProduto.Open;
    edCodigo.Clear;
    edQuantidade.Text := '1';
 end;
end;

procedure TfEstoque.FormShow(Sender: TObject);
begin
  DM.MProduto.Open;
end;

Initialization
    RegisterClass(TfEstoque);

Finalization
    RegisterClass(TfEstoque);
end.
