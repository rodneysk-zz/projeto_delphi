inherited fTelas: TfTelas
  Caption = 'Cadastro Telas'
  ClientHeight = 366
  ClientWidth = 531
  ExplicitWidth = 547
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited panBarraPrincipal: TPanel
    Width = 531
    inherited Label1: TLabel
      Width = 67
      Caption = 'Cadastro Tela'
      ExplicitWidth = 67
    end
    inherited ToolBar1: TToolBar
      Left = 324
    end
  end
  inherited groupCabec: TGroupBox
    Width = 531
    object Label2: TLabel
      Left = 85
      Top = 28
      Width = 13
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label4: TLabel
      Left = 22
      Top = 56
      Width = 76
      Height = 13
      Caption = 'Nome da Tela'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 104
      Top = 21
      Width = 57
      Height = 21
      TabStop = False
      Color = 10813439
      DataField = 'idTela'
      DataSource = dsDataSet
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 104
      Top = 48
      Width = 137
      Height = 21
      DataField = 'nomeTela'
      DataSource = dsDataSet
      TabOrder = 0
    end
  end
  inherited PageControl: TPageControl
    Width = 531
    Height = 236
    ExplicitTop = 81
    ExplicitWidth = 531
    inherited tbInfo: TTabSheet
      ExplicitWidth = 705
      inherited Group: TGroupBox
        Width = 523
        Height = 208
        ExplicitWidth = 705
        object Label3: TLabel
          Left = 18
          Top = 16
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = DBEdit2
        end
        object DBEdit2: TDBEdit
          Left = 18
          Top = 35
          Width = 159
          Height = 21
          DataField = 'descricao'
          DataSource = dsDataSet
          TabOrder = 0
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited GroupBox1: TGroupBox
        Width = 523
        Height = 208
        inherited StatusBar1: TStatusBar
          Top = 187
          Width = 519
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
          Top = 26
          Width = 519
        end
      end
    end
  end
  inherited Imagens: TImageList
    Left = 384
    Top = 57
  end
  inherited dsDataSet: TDataSource
    DataSet = DM.MTelas
    Left = 328
    Top = 56
  end
end
