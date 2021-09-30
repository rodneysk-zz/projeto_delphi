unit UTelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, TelaBase, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus;

type
  TfTelas = class(TfTelaBase)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTelas: TfTelas;

implementation

{$R *.dfm}

procedure TfTelas.FormShow(Sender: TObject);
begin
  inherited;
  DM.MTelas.Open;
end;

Initialization
    RegisterClass(TfTelas);

Finalization
    RegisterClass(TfTelas);
end.
