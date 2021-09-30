unit UProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM,TelaBase, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus;

type
  TfProduto = class(TfTelaBase)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProduto: TfProduto;

implementation

{$R *.dfm}

procedure TfProduto.FormShow(Sender: TObject);
begin
  inherited;
  DM.MProduto.Open;
end;

Initialization
    RegisterClass(TfProduto);

Finalization
    RegisterClass(TfProduto);
end.

