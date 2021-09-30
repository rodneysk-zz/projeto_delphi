inherited fProduto: TfProduto
  Caption = 'Produtos'
  ClientWidth = 476
  ExplicitWidth = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited panBarraPrincipal: TPanel
    Width = 476
    inherited Label1: TLabel
      Width = 85
      Caption = 'Cadastro Produto'
      ExplicitWidth = 85
    end
    inherited ToolBar1: TToolBar
      Left = 269
    end
  end
  inherited groupCabec: TGroupBox
    Width = 476
    Enabled = False
    object Label2: TLabel
      Left = 48
      Top = 27
      Width = 13
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 29
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 67
      Top = 19
      Width = 70
      Height = 21
      Color = 10813439
      DataField = 'idProduto'
      DataSource = dsDataSet
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 67
      Top = 46
      Width = 214
      Height = 21
      DataField = 'produto'
      DataSource = dsDataSet
      TabOrder = 0
    end
  end
  inherited PageControl: TPageControl
    Width = 476
    ActivePage = tbFiltros
    inherited tbInfo: TTabSheet
      inherited Group: TGroupBox
        Width = 468
        ExplicitLeft = -3
        ExplicitWidth = 572
        object Label4: TLabel
          Left = 12
          Top = 32
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 12
          Top = 104
          Width = 60
          Height = 13
          Caption = 'Qtd Estoque'
          FocusControl = DBEdit4
        end
        object Label6: TLabel
          Left = 12
          Top = 184
          Width = 53
          Height = 13
          Caption = 'C'#243'd Barras'
          FocusControl = DBEdit5
        end
        object DBEdit3: TDBEdit
          Left = 12
          Top = 51
          Width = 98
          Height = 21
          DataField = 'valor'
          DataSource = dsDataSet
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 12
          Top = 131
          Width = 98
          Height = 21
          DataField = 'qtdeEstoque'
          DataSource = dsDataSet
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 12
          Top = 203
          Width = 157
          Height = 21
          DataField = 'codigoBarras'
          DataSource = dsDataSet
          TabOrder = 2
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited GroupBox1: TGroupBox
        Width = 468
        inherited StatusBar1: TStatusBar
          Width = 464
          Panels = <
            item
              Text = 'N'#186' Registros:'
              Width = 50
            end
            item
              Width = 10
            end>
        end
        inherited gridDataSet: TDBGrid
          Width = 464
          Columns = <
            item
              Expanded = False
              FieldName = 'idProduto'
              Title.Caption = 'ID Produto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'produto'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtdeEstoque'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigoBarras'
              Visible = True
            end>
        end
      end
    end
  end
  inherited Imagens: TImageList
    Left = 408
  end
  inherited dsDataSet: TDataSource
    DataSet = DM.MProduto
    Left = 344
  end
end
