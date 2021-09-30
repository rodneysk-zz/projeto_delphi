unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,UDM, Data.DB;

type
  TfLogin = class(TForm)
    edUsuario: TEdit;
    btLogar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edSenha: TEdit;
    procedure btLogarClick(Sender: TObject);
    procedure chamaTela(t : string);
  private
    { Private declarations }
    function logar(usuario, senha: string): boolean;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

procedure TfLogin.btLogarClick(Sender: TObject);
begin
    //teste se o campo usuario nao e nullo
    if (edUsuario.Text = '') then
    begin
        Messagedlg('Por favor, preencha o Usuário!', mtInformation, [mbOk], 0);
          if edUsuario.CanFocus then
              edUsuario.SetFocus;
          Exit;
    end;
    //teste se o campo senha nao e nullo
    if (edSenha.Text = '') then //Verifica se o campo "Senha" foi preenchido
    begin
       Messagedlg('Por favor, informe a Senha!', mtInformation, [mbOk], 0);
          if edSenha.CanFocus then
             edSenha.SetFocus;
          Exit;
    end;

    //checa no banco se o login existe
    if logar(edUsuario.Text, edSenha.text) = true then
    begin
        //Messagedlg('Usuário logado!', mtInformation, [mbOk], 0);
        chamaTela('fMenu');

    end
    else //Caso o login nao seja válido entao
    begin
       Messagedlg('Usuário ou senha incorreto!', mtInformation, [mbOk], 0);
    end;

end;

function TFLogin.logar(usuario, senha: string): boolean;
begin
  dm.QLogin.Close;
  dm.QLogin.SQL.Text := 'select * from usuarios where nome = ''' + usuario + ''' and senha = ''' + senha + '''';
  dm.QLogin.Open;
  if dm.QLogin.RecordCount<>0 then
  begin
     Result := true;
  end;

end;

procedure TfLogin.chamaTela(t: string);
  var pc : TPersistentClass;
begin
  pc := GetClass('T' + trim(T));
  if (pc <> nil) then
  begin
    with tFormClass(pc).Create(Application) do
      try
        Name := T;
        Application.Title := 'Developed By Rodney Schultz - : ' + Copy(t,2,Length(t));

        ShowModal;
      finally
         free;
         tFormClass(pc) := nil;
      end;
  end;

end;

end.
