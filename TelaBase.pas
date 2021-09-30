unit TelaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, vcl.DBCtrls, Vcl.Menus, udm;

type
  TfTelaBase = class(TForm)
    panBarraPrincipal: TPanel;
    Label1: TLabel;
    Imagens: TImageList;
    ToolBar1: TToolBar;
    btGravar: TToolButton;
    btCancelar: TToolButton;
    btExcluir: TToolButton;
    btImprimir: TToolButton;
    btSair: TToolButton;
    btNovo: TToolButton;
    btEditar: TToolButton;
    dsDataSet: TDataSource;
    groupCabec: TGroupBox;
    PageControl: TPageControl;
    tbInfo: TTabSheet;
    tbFiltros: TTabSheet;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    Group: TGroupBox;
    gridDataSet: TDBGrid;
    btPesquisar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure dsDataSetStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure gridDataSetDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTelaBase: TfTelaBase;

implementation

{$R *.dfm}

procedure TfTelaBase.btPesquisarClick(Sender: TObject);
begin
     ActiveControl := Nil;
     try
        PageControl.SetFocus;
     Except
     end;

     dsDataSet.DataSet.Close;
     dsDataSet.DataSet.Open;

     StatusBar1.Panels[1].Text := IntToStr(dsDataSet.DataSet.RecordCount);

end;

procedure TfTelaBase.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TfTelaBase.btCancelarClick(Sender: TObject);
begin
    ActiveControl := Nil;

    if not (Sender is TForm) then
        if Application.MessageBox('Deseja cancelar a operação?', 'Cancelar',MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
            dsDataSet.DataSet.Cancel;
        end;
end;

procedure TfTelaBase.btEditarClick(Sender: TObject);
begin
    if dsDataSet.DataSet.Active then
    begin
        if not dsDataSet.DataSet.IsEmpty then
        begin
          dsDataSet.DataSet.Edit;
          PageControl.ActivePageIndex := 0
        end
        else
          ShowMessage('Nao há registros a alterar');
    end;

end;

procedure TfTelaBase.btExcluirClick(Sender: TObject);
begin
   if dsDataSet.DataSet.Active then
    begin
        if not dsDataSet.DataSet.IsEmpty then
        begin
            if Application.MessageBox('Deseja excluir o registro?', 'Exclusao',MB_YESNO + MB_ICONWARNING) = ID_YES then
                dsDataSet.DataSet.Delete;
        end
        else
          ShowMessage('Nao há registros a Excluir');
    end;
end;

procedure TfTelaBase.btGravarClick(Sender: TObject);
begin
    ActiveControl := Nil;
    dsDataSet.DataSet.Post;

    //atualiza apos salvar
    btPesquisarClick(btPesquisar);
end;

procedure TfTelaBase.btImprimirClick(Sender: TObject);
begin
   if (dsDataSet.DataSet.IsEmpty) or (not dsDataSet.DataSet.Active) then
   begin
     ShowMessage('Não a registros para imprimir!');
     Abort;
   end;
end;

procedure TfTelaBase.btNovoClick(Sender: TObject);
begin
    if ActiveControl = gridDataSet then
      ActiveControl := Nil;

    if not dsDataSet.DataSet.Active then
      dsDataSet.DataSet.Open;

    dsDataSet.DataSet.Append;
    PageControl.ActivePageIndex := 0;
end;

procedure TfTelaBase.dsDataSetStateChange(Sender: TObject);
var
  i : integer;
begin
  //Libera Campos
  tbFiltros.TabVisible  := dsDataSet.DataSet.State in [dsBrowse, dsInactive ];
  group.Enabled         := dsDataSet.DataSet.State in dsEditModes;
  groupCabec.Enabled    := dsDataSet.DataSet.State in dsEditModes;

  //Habilita Botões
  btNovo.Enabled        := not(dsDataSet.DataSet.State in dsEditModes);
  btEditar.Enabled      := not(dsDataSet.DataSet.State in dsEditModes) and not (dsDataSet.DataSet.IsEmpty);
  btGravar.Enabled      :=    (dsDataSet.DataSet.State in dsEditModes);
  btCancelar.Enabled    :=    (dsDataSet.DataSet.State in dsEditModes);
  btPesquisar.Enabled   := not(dsDataSet.DataSet.State in dsEditModes);
  btExcluir.Enabled     := not(dsDataSet.DataSet.State in dsEditModes) and not (dsDataSet.DataSet.IsEmpty);
  btImprimir.Enabled    := not(dsDataSet.DataSet.State in dsEditModes);
  btSair.Enabled        := not(dsDataSet.DataSet.State in dsEditModes);


  DM.QLogin.First;
  for i := 0  to pred(dm.QLogin.RecordCount)  do
   begin
      if(DM.QLogin.FieldbyName('nomeTela').Value = Screen.ActiveForm.Name)then
      begin
         btNovo.Enabled        := DM.QLogin.FieldbyName('inserir').Value;
         btEditar.Enabled      := DM.QLogin.FieldbyName('alterar').Value;
         btExcluir.Enabled     := DM.QLogin.FieldbyName('excluir').Value;
         btImprimir.Enabled    := DM.QLogin.FieldbyName('imprimir').Value;
      end;
      DM.QLogin.Next;
   end;
end;


procedure TfTelaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dsDataSet.DataSet.Close;

    Action        := caFree;
    TForm(Sender) := Nil;
end;

procedure TfTelaBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dsDataSet.DataSet.State in dsEditModes then
    if Application.MessageBox('Deseja Gravar Alterações?',pChar(Application.Title),MB_YESNO + MB_ICONQUESTION)= ID_YES then
        btGravarClick(btGravar)
    else
        btCancelarClick(btCancelar);
end;

procedure TfTelaBase.FormCreate(Sender: TObject);
begin
  TForm(Sender) := Self;
end;

procedure TfTelaBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if(Key = VK_RETURN)
      and not (ActiveControl is TDBGrid)
      and not (ActiveControl is tDBMemo)
      and not (ActiveControl is tMemo)
      and not (ActiveControl is tDBrichEdit)
      then
      perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfTelaBase.FormShow(Sender: TObject);
begin
  dsDataSetStateChange(dsDataSet);
  PageControl.ActivePage := tbFiltros;
end;

procedure TfTelaBase.gridDataSetDblClick(Sender: TObject);
begin
    PageControl.TabIndex := 0;
end;

end.
