object DM: TDM
  OldCreateOrder = False
  Height = 348
  Width = 942
  object Connection: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=Trabalho5;Data Source=DESKTOP-52BBEPR\SQLEXPRESS;Ini' +
      'tial File Name="";Server SPN="";password="123456"'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 24
    Top = 8
  end
  object QCliente: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cliente')
    Left = 232
    Top = 72
  end
  object MCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PCliente'
    AfterPost = MClienteAfterPost
    AfterCancel = MClienteAfterCancel
    AfterDelete = MClienteAfterDelete
    Left = 232
    Top = 200
    object MClienteidCliente: TAutoIncField
      DisplayLabel = 'ID Cliente'
      FieldName = 'idCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MClientenomeCliente: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nomeCliente'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
    object MClientecnpj: TWideStringField
      DisplayLabel = 'CPNJ'
      FieldName = 'cnpj'
      ProviderFlags = [pfInUpdate]
      EditMask = '###.###.###/####-##;1;_'
      FixedChar = True
    end
    object MClientedtNascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dtNascimento'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object MClienteidCidade: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'idCidade'
      ProviderFlags = [pfInUpdate]
    end
    object MClienteendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
    object MClientecep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      ProviderFlags = [pfInUpdate]
      EditMask = '00000\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object MClientenumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      ProviderFlags = [pfInUpdate]
    end
    object MClientecomplemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object MClienteemail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
  end
  object PCliente: TDataSetProvider
    DataSet = QCliente
    Left = 232
    Top = 136
  end
  object QCidade: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cidade')
    Left = 304
    Top = 72
  end
  object PCidade: TDataSetProvider
    DataSet = QCidade
    Left = 304
    Top = 136
  end
  object MCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PCidade'
    Left = 304
    Top = 200
    object MCidadeidCidade: TAutoIncField
      FieldName = 'idCidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MCidadecidade: TWideStringField
      FieldName = 'cidade'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
  end
  object DSCidade: TDataSource
    DataSet = MCidade
    Left = 304
    Top = 264
  end
  object PUsuario: TDataSetProvider
    DataSet = QUsuario
    Left = 24
    Top = 136
  end
  object QTelas: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from telas')
    Left = 92
    Top = 72
    object QTelasidTela: TAutoIncField
      FieldName = 'idTela'
      ReadOnly = True
    end
    object QTelasdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object QTelasnomeTela: TStringField
      FieldName = 'nomeTela'
    end
  end
  object PTelas: TDataSetProvider
    DataSet = QTelas
    Left = 92
    Top = 136
  end
  object MTelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PTelas'
    AfterPost = MTelasAfterPost
    AfterCancel = MTelasAfterCancel
    AfterDelete = MTelasAfterDelete
    Left = 92
    Top = 200
    object MTelasidTela: TAutoIncField
      DisplayLabel = 'ID Tela'
      FieldName = 'idTela'
      ReadOnly = True
    end
    object MTelasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object MTelasnomeTela: TStringField
      DisplayLabel = 'Nome da Tela'
      FieldName = 'nomeTela'
    end
  end
  object QUsuario_Telas: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    BeforeOpen = QUsuario_TelasBeforeOpen
    Parameters = <
      item
        Name = 'idusuario'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select us.*, t.descricao, u.nome from usuariostelas as us, telas' +
        ' as t, usuarios as u '
      
        'where us.idTela = t.idTela and us.idUsuario = u.idUsuario and us' +
        '.idusuario = :idusuario ')
    Left = 160
    Top = 72
    object QUsuario_Telasid: TAutoIncField
      FieldName = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QUsuario_TelasidTela: TIntegerField
      FieldName = 'idTela'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_TelasidUsuario: TIntegerField
      FieldName = 'idUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_Telasinserir: TBooleanField
      FieldName = 'inserir'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_Telasalterar: TBooleanField
      FieldName = 'alterar'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_Telasexcluir: TBooleanField
      FieldName = 'excluir'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_Telasimprimir: TBooleanField
      FieldName = 'imprimir'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuario_Telasdescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = []
      Size = 50
    end
    object QUsuario_Telasnome: TStringField
      FieldName = 'nome'
      ProviderFlags = []
      Size = 10
    end
  end
  object PUsuario_Telas: TDataSetProvider
    DataSet = QUsuario_Telas
    Left = 160
    Top = 136
  end
  object MUsuario_Telas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PUsuario_Telas'
    AfterPost = MUsuario_TelasAfterPost
    AfterCancel = MUsuario_TelasAfterCancel
    AfterDelete = MUsuario_TelasAfterDelete
    Left = 160
    Top = 200
    object MUsuario_Telasid: TAutoIncField
      FieldName = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MUsuario_TelasidTela: TIntegerField
      DisplayLabel = 'ID Tela'
      FieldName = 'idTela'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_TelasidUsuario: TIntegerField
      DisplayLabel = 'ID Usuario'
      FieldName = 'idUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_Telasinserir: TBooleanField
      DisplayLabel = 'Inserir'
      FieldName = 'inserir'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_Telasalterar: TBooleanField
      DisplayLabel = 'Alterar'
      FieldName = 'alterar'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_Telasexcluir: TBooleanField
      DisplayLabel = 'Excluir'
      FieldName = 'excluir'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_Telasimprimir: TBooleanField
      DisplayLabel = 'Imprimir'
      FieldName = 'imprimir'
      ProviderFlags = [pfInUpdate]
    end
    object MUsuario_Telasdescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = []
      Size = 50
    end
    object MUsuario_Telasnome: TStringField
      FieldName = 'nome'
      ProviderFlags = []
      Size = 10
    end
  end
  object DSUsuario_Telas: TDataSource
    DataSet = MUsuario_Telas
    Left = 160
    Top = 264
  end
  object DSTelas: TDataSource
    DataSet = MTelas
    Left = 91
    Top = 264
  end
  object MUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PUsuario'
    AfterPost = MUsuarioAfterPost
    AfterCancel = MUsuarioAfterCancel
    BeforeDelete = MUsuarioBeforeDelete
    AfterDelete = MUsuarioAfterDelete
    AfterScroll = MUsuarioAfterScroll
    Left = 24
    Top = 200
    object MUsuarioidUsuario: TAutoIncField
      FieldName = 'idUsuario'
      ReadOnly = True
    end
    object MUsuarionome: TStringField
      FieldName = 'nome'
      Size = 10
    end
    object MUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
  end
  object QUsuario: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from usuarios')
    Left = 24
    Top = 72
  end
  object QLogin: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    Left = 160
    Top = 8
  end
  object QProduto: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produto')
    Left = 448
    Top = 72
  end
  object PProduto: TDataSetProvider
    DataSet = QProduto
    Left = 448
    Top = 136
  end
  object MProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PProduto'
    AfterPost = MProdutoAfterPost
    AfterCancel = MProdutoAfterCancel
    AfterDelete = MProdutoAfterDelete
    Left = 448
    Top = 200
    object MProdutoidProduto: TAutoIncField
      FieldName = 'idProduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MProdutoproduto: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'produto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
    object MProdutovalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      ProviderFlags = [pfInUpdate]
    end
    object MProdutoqtdeEstoque: TIntegerField
      DisplayLabel = 'Quantidade Estoque'
      FieldName = 'qtdeEstoque'
      ProviderFlags = [pfInUpdate]
    end
    object MProdutocodigoBarras: TWideStringField
      DisplayLabel = 'Codigo Barras'
      FieldName = 'codigoBarras'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
  end
  object DSProdutos: TDataSource
    DataSet = MProduto
    Left = 448
    Top = 264
  end
  object DSCliente: TDataSource
    DataSet = MCliente
    Left = 232
    Top = 264
  end
  object QPedidos: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.*,c.nomeCliente from pedidos AS p, cliente AS C WHERE p' +
        '.idcliente = c.idCliente')
    Left = 376
    Top = 72
    object QPedidosidPedido: TAutoIncField
      DisplayLabel = 'ID Pedido'
      FieldName = 'idPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPedidosidCliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object QPedidosdtCadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dtCadastro'
      ProviderFlags = [pfInUpdate]
    end
    object QPedidosdtPrevistaEntrega: TDateField
      DisplayLabel = 'Data Prevista Entrega'
      FieldName = 'dtPrevistaEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object QPedidosnomeCliente: TWideStringField
      FieldName = 'nomeCliente'
      FixedChar = True
      Size = 50
    end
  end
  object PPedidos: TDataSetProvider
    DataSet = QPedidos
    Left = 376
    Top = 136
  end
  object MPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PPedidos'
    AfterPost = MPedidosAfterPost
    AfterCancel = MPedidosAfterCancel
    BeforeDelete = MPedidosBeforeDelete
    AfterDelete = MPedidosAfterDelete
    AfterScroll = MPedidosAfterScroll
    Left = 376
    Top = 200
    object MPedidosidPedido: TAutoIncField
      DisplayLabel = 'ID Pedido'
      FieldName = 'idPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MPedidosidCliente: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object MPedidosnomeCliente: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nomeCliente'
      FixedChar = True
      Size = 50
    end
    object MPedidosdtCadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dtCadastro'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object MPedidosdtPrevistaEntrega: TDateField
      DisplayLabel = 'Data Prevista Entrega'
      FieldName = 'dtPrevistaEntrega'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
  end
  object QVendas_Produtos: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    BeforeOpen = QVendas_ProdutosBeforeOpen
    Parameters = <
      item
        Name = 'idpedido'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select vp.*, p.produto,p.valor,ped.dtPrevistaEntrega,c.nomeClien' +
        'te, vp.quantida * p.valor as total from vendasProdutos as vp, pr' +
        'oduto as p, cliente as c, pedidos as ped'
      
        'where vp.idProduto = p.idProduto and vp.idPedido = ped.idPedido ' +
        'and ped.idCliente = c.idCliente  and vp.idpedido = :idpedido ')
    Left = 528
    Top = 72
  end
  object PVendas_Produtos: TDataSetProvider
    DataSet = QVendas_Produtos
    Left = 528
    Top = 136
  end
  object MVendas_Produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PVendas_Produtos'
    AfterPost = MVendas_ProdutosAfterPost
    AfterCancel = MVendas_ProdutosAfterCancel
    AfterDelete = MVendas_ProdutosAfterDelete
    Left = 528
    Top = 200
    object MVendas_ProdutosidVenda: TAutoIncField
      FieldName = 'idVenda'
      ReadOnly = True
    end
    object MVendas_ProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object MVendas_ProdutosidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object MVendas_Produtosquantida: TIntegerField
      FieldName = 'quantida'
    end
    object MVendas_Produtosproduto: TWideStringField
      FieldName = 'produto'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
    object MVendas_Produtosvalor: TFloatField
      FieldName = 'valor'
      ProviderFlags = []
    end
    object MVendas_ProdutosdtPrevistaEntrega: TDateField
      FieldName = 'dtPrevistaEntrega'
      ProviderFlags = []
    end
    object MVendas_ProdutosnomeCliente: TWideStringField
      FieldName = 'nomeCliente'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
    object MVendas_Produtostotal: TFloatField
      FieldName = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSVendas_Produtos: TDataSource
    DataSet = MVendas_Produtos
    Left = 528
    Top = 264
  end
  object QAux: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 92
    Top = 8
  end
  object QFaturamento: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select f.*,c.nomeCliente from faturamento AS F, cliente AS C WHE' +
        'RE f.idcliente = c.idCliente')
    Left = 624
    Top = 72
    object QFaturamentoidFaturamento: TIntegerField
      DisplayLabel = 'ID Faturamento'
      FieldName = 'idFaturamento'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QFaturamentodataFaturamento: TDateField
      DisplayLabel = 'Data Faturamento'
      FieldName = 'dataFaturamento'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object QFaturamentoidCliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object QFaturamentonomeCliente: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nomeCliente'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
  end
  object PFaturamento: TDataSetProvider
    DataSet = QFaturamento
    Left = 624
    Top = 136
  end
  object MFaturamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PFaturamento'
    AfterPost = MFaturamentoAfterPost
    AfterCancel = MFaturamentoAfterCancel
    AfterDelete = MFaturamentoAfterDelete
    AfterScroll = MFaturamentoAfterScroll
    Left = 624
    Top = 200
    object MFaturamentoidFaturamento: TIntegerField
      DisplayLabel = 'ID Faturamento'
      FieldName = 'idFaturamento'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object MFaturamentodataFaturamento: TDateField
      DisplayLabel = 'Data Faturamento'
      FieldName = 'dataFaturamento'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object MFaturamentoidCliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object MFaturamentonomeCliente: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nomeCliente'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
  end
  object QClienteFat: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select c.idCliente, c.nomeCliente'
      
        'from cliente as c, pedidos as p, vendasProdutos as vp , produto ' +
        'as pr'
      'where c.idCliente = p.idCliente '
      'and p.idPedido = vp.idPedido '
      'and vp.idProduto = pr.idProduto'
      'group by c.idCliente , c.nomeCliente')
    Left = 696
    Top = 72
  end
  object PClienteFat: TDataSetProvider
    DataSet = QClienteFat
    Left = 696
    Top = 136
  end
  object MClienteFat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PClienteFat'
    Left = 696
    Top = 200
    object MClienteFatidCliente: TAutoIncField
      FieldName = 'idCliente'
      ReadOnly = True
    end
    object MClienteFatnomeCliente: TWideStringField
      FieldName = 'nomeCliente'
      FixedChar = True
      Size = 50
    end
  end
  object DSClienteFat: TDataSource
    DataSet = MClienteFat
    Left = 696
    Top = 264
  end
  object QProdutoFat: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    BeforeOpen = QProdutoFatBeforeOpen
    Parameters = <
      item
        Name = 'idCliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ''
      
        'select vp.idVenda,vp.idPedido, vp.quantida,vp.idProduto, pr.valo' +
        'r, pr.qtdeEstoque , pr.produto'
      
        'from cliente as c, pedidos as p, vendasProdutos as vp , produto ' +
        'as pr '
      'where c.idCliente = p.idCliente  '
      'and p.idPedido = vp.idPedido  '
      'and vp.idProduto = pr.idProduto '
      'and c.idCliente = :idCliente')
    Left = 776
    Top = 72
    object QProdutoFatidVenda: TAutoIncField
      FieldName = 'idVenda'
      ReadOnly = True
    end
    object QProdutoFatidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object QProdutoFatquantida: TIntegerField
      FieldName = 'quantida'
    end
    object QProdutoFatidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object QProdutoFatvalor: TFloatField
      FieldName = 'valor'
    end
    object QProdutoFatqtdeEstoque: TIntegerField
      FieldName = 'qtdeEstoque'
    end
    object QProdutoFatproduto: TWideStringField
      FieldName = 'produto'
      FixedChar = True
      Size = 50
    end
  end
  object PProdutoFat: TDataSetProvider
    DataSet = QProdutoFat
    Left = 776
    Top = 136
  end
  object MProdutoFat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PProdutoFat'
    Left = 776
    Top = 200
    object MProdutoFatidVenda: TAutoIncField
      FieldName = 'idVenda'
      ReadOnly = True
    end
    object MProdutoFatidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object MProdutoFatquantida: TIntegerField
      FieldName = 'quantida'
    end
    object MProdutoFatidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object MProdutoFatvalor: TFloatField
      FieldName = 'valor'
    end
    object MProdutoFatqtdeEstoque: TIntegerField
      FieldName = 'qtdeEstoque'
    end
    object MProdutoFatproduto: TWideStringField
      FieldName = 'produto'
      FixedChar = True
      Size = 50
    end
  end
  object DSProdutoFat: TDataSource
    DataSet = MProdutoFat
    Left = 624
    Top = 264
  end
  object PFaturamento_Item: TDataSetProvider
    DataSet = QFaturamento_Item
    Left = 872
    Top = 136
  end
  object MFaturamento_item: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PFaturamento_Item'
    AfterPost = MFaturamento_itemAfterPost
    AfterCancel = MFaturamento_itemAfterCancel
    AfterDelete = MFaturamento_itemAfterDelete
    Left = 872
    Top = 208
    object MFaturamento_itemidFaturamentoItem: TAutoIncField
      FieldName = 'idFaturamentoItem'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MFaturamento_itemidFaturamento: TIntegerField
      FieldName = 'idFaturamento'
      ProviderFlags = [pfInUpdate]
    end
    object MFaturamento_itemidProduto: TIntegerField
      FieldName = 'idProduto'
      ProviderFlags = [pfInUpdate]
    end
    object MFaturamento_itemidPedido: TIntegerField
      FieldName = 'idPedido'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DSFaturamento_Item: TDataSource
    DataSet = MFaturamento_item
    Left = 872
    Top = 264
  end
  object QFaturamento_Item: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    BeforeOpen = QFaturamento_ItemBeforeOpen
    Parameters = <
      item
        Name = 'idFaturamento'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from faturamentoitem where idFaturamento = :idFaturamen' +
        'to ')
    Left = 872
    Top = 72
  end
end
