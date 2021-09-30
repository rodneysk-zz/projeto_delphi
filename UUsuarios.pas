unit UUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM,TelaBase, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Menus;

type
  TfUsuarios = class(TfTelaBase)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CBAlterar: TCheckBox;
    CBExcluir: TCheckBox;
    CBImprimir: TCheckBox;
    CBInserir: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsuarios: TfUsuarios;

implementation

{$R *.dfm}

procedure TfUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  DM.MUsuario.Open;
  DM.MTelas.Open;
  Dm.MUsuario_Telas.Open;

end;


procedure TfUsuarios.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if (DM.MUsuarioidUsuario.AsInteger > 0 ) then
  begin
    DM.MUsuario_Telas.First;
    while not DM.MUsuario_Telas.eof do
    begin
      if(DM.MUsuario_TelasidUsuario.AsInteger = DM.MUsuarioidUsuario.AsInteger ) and
      (DM.MUsuario_TelasidTela.AsInteger = StrToInt(DBLookupComboBox1.KeyValue)) then
          begin
            ShowMessage('ESTA TELA JA FOI CADASTRADA A ESTE USUARIO');
            abort
          end;
      DM.MUsuario_Telas.Next;
    end;

    DM.MUsuario_Telas.Append;
    DM.MUsuario_TelasidUsuario.AsInteger  :=  DM.MUsuarioidUsuario.AsInteger;
    DM.MUsuario_TelasidTela.AsInteger     :=  StrToInt(DBLookupComboBox1.KeyValue);
    DM.MUsuario_Telasinserir.AsBoolean    :=  CBInserir.Checked;
    DM.MUsuario_Telasalterar.AsBoolean    :=  CBAlterar.Checked;
    DM.MUsuario_Telasexcluir.AsBoolean    :=  CBExcluir.Checked;
    DM.MUsuario_Telasimprimir.AsBoolean   :=  CBImprimir.Checked;
    DM.MUsuario_Telas.Post;

    DM.MUsuario_Telas.Close;
    DM.QUsuario_Telas.Close;
    DM.QUsuario_Telas.Open;
    DM.MUsuario_Telas.Open;
   end;
end;

procedure TfUsuarios.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja Realmente Excluir o Registro ?' , 'Exclusão' , MB_YESNO + MB_ICONWARNING ) = ID_YES then
      DM.MUsuario_Telas.Delete;
end;

Initialization
    RegisterClass(TfUsuarios);

Finalization
    RegisterClass(TfUsuarios);
end.
