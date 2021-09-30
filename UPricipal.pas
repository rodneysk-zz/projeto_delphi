unit UPricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UCliente,UDM, Vcl.Menus,
  System.Actions, Vcl.ActnList;

type
    TfMenu = class(TForm)
    procedure chamaTela(t : string);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionarGuiaMenu(pMenuPrincipal: TMainMenu; pCaptionItem: string);
    procedure AdicionarItem(pMenuPrincipal: TMainMenu; pPosHoriz: Byte; pCaptionItem: string; pNameItem: string);
    procedure clique(Sender: TObject);
  end;

var
  fMenu: TfMenu;

implementation

{$R *.dfm}

 procedure TfMenu.AdicionarGuiaMenu(pMenuPrincipal: TMainMenu;
  pCaptionItem: string);
var
  NovoItem: TMenuItem;
begin
  NovoItem:= TMenuItem.Create(self);
  NovoItem.Caption:= pCaptionItem;
  pMenuPrincipal.Items.Add(NovoItem);
end;

procedure TfMenu.AdicionarItem(pMenuPrincipal: TMainMenu;
  pPosHoriz: Byte; pCaptionItem: string; pNameItem: string);
var
  NovoItem: TMenuItem;
  i: Integer;
begin
  NovoItem          := TMenuItem.Create(Self);
  NovoItem.Caption  := pCaptionItem;
  NovoItem.Name     := pNameItem;
  NovoItem.OnClick  := clique;
  pMenuPrincipal.Items[pPosHoriz].Add(NovoItem);
end;

procedure TfMenu.clique(Sender:TObject);
begin
 chamaTela(TMenuItem(Sender).Name);
end;

procedure TfMenu.chamaTela(t: string);
  var pc : TPersistentClass;
begin
  pc := GetClass('T' + trim(T));
  if (pc <> nil) then
  begin
    with tFormClass(pc).Create(Application) do
      try
        Name := T;
        Application.Title := 'Developed By Rodney Schultz- : ' + Copy(t,2,Length(t));

        ShowModal;
      finally
         free;
         tFormClass(pc) := nil;
      end;
  end;
end;

procedure TfMenu.FormShow(Sender: TObject);
var
main : TMainMenu;
i,idUsuario : Integer;
begin

  main := TMainMenu.Create(self);
  AdicionarGuiaMenu(main,'Cadastros');
  idUsuario := DM.QLogin.FieldbyName('idUsuario').Value;

  DM.QLogin.Close;
  DM.QLogin.SQL.Text := 'select * from  usuariostelas as ut join usuarios as u on ut.idUsuario = u.idUsuario join telas as t on ut.idTela = t.idTela where ut.idUsuario =' + idUsuario.ToString();
  //DM.QAux.Parameters.ParamByName('idUsuario') := idUsuario;
  DM.QLogin.Open;
   for i := 0  to pred(dm.QLogin.RecordCount)  do
   begin
      AdicionarItem(main,0,DM.QLogin.FieldbyName('descricao').Value,DM.QLogin.FieldbyName('nomeTela').Value);
      DM.QLogin.Next;
   end;
end;

Initialization
    RegisterClass(TfMenu);

Finalization
    RegisterClass(TfMenu);

end.
