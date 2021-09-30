unit UCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, TelaBase, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfCliente = class(TfTelaBase)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}


procedure TfCliente.FormShow(Sender: TObject);
begin
  inherited;
  dm.MCliente.Open;
  dm.MCidade.Open;
end;

Initialization
    RegisterClass(TfCliente);

Finalization
    RegisterClass(TfCliente);
end.
