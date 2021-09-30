inherited fCliente: TfCliente
  Caption = 'Cliente'
  ClientHeight = 413
  ClientWidth = 578
  ExplicitWidth = 594
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited panBarraPrincipal: TPanel
    Width = 578
    ExplicitWidth = 640
    inherited Label1: TLabel
      Width = 80
      Caption = 'Cadastro Cliente'
      ExplicitWidth = 80
    end
    inherited ToolBar1: TToolBar
      Left = 371
      ExplicitLeft = 371
    end
  end
  inherited groupCabec: TGroupBox
    Width = 578
    Height = 96
    ExplicitWidth = 640
    ExplicitHeight = 96
    object Label2: TLabel
      Left = 43
      Top = 27
      Width = 13
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 164
      Top = 27
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label12: TLabel
      Left = 24
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 62
      Top = 19
      Width = 134
      Height = 21
      Color = 10813439
      DataField = 'idCliente'
      DataSource = dsDataSet
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 62
      Top = 46
      Width = 219
      Height = 21
      DataField = 'nomeCliente'
      DataSource = dsDataSet
      TabOrder = 0
    end
  end
  inherited PageControl: TPageControl
    Top = 121
    Width = 578
    Height = 292
    ExplicitTop = 121
    ExplicitWidth = 640
    ExplicitHeight = 292
    inherited tbInfo: TTabSheet
      ExplicitWidth = 632
      ExplicitHeight = 264
      inherited Group: TGroupBox
        Width = 570
        Height = 264
        ExplicitWidth = 632
        ExplicitHeight = 264
        object Label4: TLabel
          Left = 187
          Top = 189
          Width = 25
          Height = 13
          Caption = 'CPNJ'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 395
          Top = 38
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label7: TLabel
          Left = 20
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit6
        end
        object Label9: TLabel
          Left = 242
          Top = 16
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = DBEdit8
        end
        object Label10: TLabel
          Left = 20
          Top = 74
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = DBEdit9
        end
        object Label11: TLabel
          Left = 20
          Top = 128
          Width = 28
          Height = 13
          Caption = 'E-mail'
          FocusControl = DBEdit10
        end
        object Label5: TLabel
          Left = 20
          Top = 189
          Width = 81
          Height = 13
          Caption = 'Data Nascimento'
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 242
          Top = 74
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit7
        end
        object DBEdit3: TDBEdit
          Left = 187
          Top = 208
          Width = 145
          Height = 21
          DataField = 'cnpj'
          DataSource = dsDataSet
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 20
          Top = 35
          Width = 197
          Height = 21
          DataField = 'endereco'
          DataSource = dsDataSet
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 242
          Top = 35
          Width = 90
          Height = 21
          DataField = 'numero'
          DataSource = dsDataSet
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 20
          Top = 93
          Width = 197
          Height = 21
          DataField = 'complemento'
          DataSource = dsDataSet
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 20
          Top = 147
          Width = 197
          Height = 21
          DataField = 'email'
          DataSource = dsDataSet
          TabOrder = 7
        end
        object DBEdit4: TDBEdit
          Left = 20
          Top = 205
          Width = 109
          Height = 21
          DataField = 'dtNascimento'
          DataSource = dsDataSet
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 242
          Top = 93
          Width = 90
          Height = 21
          DataField = 'cep'
          DataSource = dsDataSet
          TabOrder = 5
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 395
          Top = 66
          Width = 149
          Height = 21
          DataField = 'idCidade'
          DataSource = dsDataSet
          KeyField = 'idCidade'
          ListField = 'cidade'
          ListSource = DM.DSCidade
          TabOrder = 4
        end
      end
    end
    inherited tbFiltros: TTabSheet
      ExplicitWidth = 632
      ExplicitHeight = 264
      inherited GroupBox1: TGroupBox
        Width = 570
        Height = 264
        ExplicitWidth = 632
        ExplicitHeight = 264
        inherited StatusBar1: TStatusBar
          Top = 243
          Width = 566
          Panels = <
            item
              Text = 'N'#186' Registros:'
              Width = 50
            end
            item
              Width = 10
            end>
          ExplicitTop = 243
          ExplicitWidth = 628
        end
        inherited gridDataSet: TDBGrid
          Top = 82
          Width = 566
          Columns = <
            item
              Expanded = False
              FieldName = 'idCliente'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeCliente'
              Width = 177
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cnpj'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtNascimento'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Visible = True
            end>
        end
      end
    end
  end
  inherited Imagens: TImageList
    Left = 392
  end
  inherited dsDataSet: TDataSource
    DataSet = DM.MCliente
    Left = 328
  end
end
