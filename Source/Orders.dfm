inherited frmOrders: TfrmOrders
  Caption = 'Pedidos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBase: TPageControl
    inherited tsDetails: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 652
      ExplicitHeight = 367
      object Label1: TLabel
        Left = 7
        Top = 7
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 7
        Top = 47
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label3: TLabel
        Left = 7
        Top = 87
        Width = 24
        Height = 13
        Caption = 'Total'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 69
        Top = 7
        Width = 33
        Height = 13
        Caption = 'Cliente'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 7
        Top = 23
        Width = 50
        Height = 21
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'IDORDER'
        DataSource = dsMain
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 7
        Top = 103
        Width = 100
        Height = 21
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'TOTALPRICE'
        DataSource = dsMain
        ReadOnly = True
        TabOrder = 1
      end
      object dtOrder: TDateTimePicker
        Left = 7
        Top = 63
        Width = 100
        Height = 21
        Date = 45559.000000000000000000
        Time = 45559.000000000000000000
        TabOrder = 2
        OnChange = dtOrderChange
      end
      object pcOrdersItems: TPageControl
        Left = 0
        Top = 144
        Width = 652
        Height = 223
        ActivePage = tsOrdersItems
        Align = alBottom
        TabOrder = 3
        object tsOrdersItems: TTabSheet
          Caption = 'Itens'
          object Label5: TLabel
            Left = 3
            Top = 48
            Width = 11
            Height = 13
            Caption = 'ID'
            FocusControl = DBEdit2
          end
          object Label6: TLabel
            Left = 3
            Top = 88
            Width = 56
            Height = 13
            Caption = 'Quantidade'
            FocusControl = DBEdit4
          end
          object Label7: TLabel
            Left = 99
            Top = 88
            Width = 27
            Height = 13
            Caption = 'Pre'#231'o'
            FocusControl = DBEdit5
          end
          object Label8: TLabel
            Left = 65
            Top = 48
            Width = 38
            Height = 13
            Caption = 'Produto'
            FocusControl = DBEdit1
          end
          object DBEdit2: TDBEdit
            Left = 3
            Top = 64
            Width = 50
            Height = 21
            DataField = 'IDORDER_ITEM'
            DataSource = dsOrdersItems
            TabOrder = 0
          end
          object DBEdit4: TDBEdit
            Left = 3
            Top = 104
            Width = 80
            Height = 21
            DataField = 'AMOUNT'
            DataSource = dsOrdersItems
            TabOrder = 1
            OnKeyPress = DBEdit4KeyPress
          end
          object DBEdit5: TDBEdit
            Left = 99
            Top = 104
            Width = 80
            Height = 21
            DataField = 'PRICE'
            DataSource = dsOrdersItems
            TabOrder = 2
            OnKeyPress = DBEdit5KeyPress
          end
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 644
            Height = 33
            DataSource = dsOrdersItems
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
            Align = alTop
            TabOrder = 3
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 65
            Top = 64
            Width = 304
            Height = 21
            DataField = 'IDPRODUCT'
            DataSource = dsOrdersItems
            KeyField = 'IDPRODUCT'
            ListField = 'NAMEPRODUCT'
            ListSource = dsProduct
            TabOrder = 4
          end
        end
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 69
        Top = 23
        Width = 304
        Height = 21
        DataField = 'IDCLIENT'
        DataSource = dsMain
        KeyField = 'IDCLIENT'
        ListField = 'NAMECLIENT'
        ListSource = dsClient
        TabOrder = 4
      end
    end
  end
  inherited pnlTop: TPanel
    inherited btnSave: TButton
      Left = 74
      ExplicitLeft = 74
    end
    inherited btnDelete: TButton
      Left = 147
      ExplicitLeft = 147
    end
    object Button1: TButton
      Left = 221
      Top = 0
      Width = 75
      Height = 49
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  inherited fdqSearch: TFDQuery
    SQL.Strings = (
      'SELECT O.IDORDER, O.TOTALPRICE, C.NAMECLIENT'
      'FROM MFORDERS O '
      'JOIN MFCLIENT C ON O.IDCLIENT = C.IDCLIENT')
    object fdqSearchIDORDER: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDORDER'
      Origin = 'IDORDER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSearchNAMECLIENT: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NAMECLIENT'
      Origin = 'NAMECLIENT'
      Required = True
      Size = 50
    end
    object fdqSearchTOTALPRICE: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTALPRICE'
      Origin = 'TOTALPRICE'
    end
  end
  inherited fdqMain: TFDQuery
    AfterDelete = fdqMainAfterDelete
    AfterApplyUpdates = fdqMainAfterApplyUpdates
    SQL.Strings = (
      'SELECT O.*'
      'FROM MFORDERS O '
      'WHERE O.IDORDER = :IDORDER')
    ParamData = <
      item
        Name = 'IDORDER'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdqMainIDORDER: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDORDER'
      Origin = 'IDORDER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqMainIDCLIENT: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDCLIENT'
      Origin = 'IDCLIENT'
      Required = True
    end
    object fdqMainDTORDER: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DTORDER'
      Origin = 'DTORDER'
    end
    object fdqMainTOTALPRICE: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTALPRICE'
      Origin = 'TOTALPRICE'
    end
  end
  object fdqClient: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT *'
      'FROM MFCLIENT')
    Left = 556
    Top = 193
    object fdqClientIDCLIENT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDCLIENT'
      Origin = 'IDCLIENT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqClientNAMECLIENT: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NAMECLIENT'
      Origin = 'NAMECLIENT'
      Required = True
      Size = 50
    end
    object fdqClientTELEPHONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEPHONE'
      Origin = 'TELEPHONE'
      Size = 30
    end
    object fdqClientEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object fdqClientADDRESSCLIENT: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ADDRESSCLIENT'
      Origin = 'ADDRESSCLIENT'
      Size = 100
    end
  end
  object dsClient: TDataSource
    DataSet = fdqClient
    Left = 500
    Top = 193
  end
  object dsOrdersItems: TDataSource
    DataSet = fdqOrdersItems
    OnStateChange = dsOrdersItemsStateChange
    Left = 508
    Top = 257
  end
  object fdqOrdersItems: TFDQuery
    AfterInsert = fdqOrdersItemsAfterInsert
    BeforeScroll = fdqOrdersItemsBeforeScroll
    CachedUpdates = True
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT *'
      'FROM MFORDERS_ITEMS'
      'WHERE IDORDER = :IDORDER')
    Left = 564
    Top = 257
    ParamData = <
      item
        Name = 'IDORDER'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdqOrdersItemsIDORDER_ITEM: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDORDER_ITEM'
      Origin = 'IDORDER_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqOrdersItemsIDORDER: TIntegerField
      FieldName = 'IDORDER'
      Origin = 'IDORDER'
      Required = True
    end
    object fdqOrdersItemsIDPRODUCT: TIntegerField
      FieldName = 'IDPRODUCT'
      Origin = 'IDPRODUCT'
      Required = True
      OnChange = fdqOrdersItemsIDPRODUCTChange
    end
    object fdqOrdersItemsAMOUNT: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'AMOUNT'
      Origin = 'AMOUNT'
      Required = True
    end
    object fdqOrdersItemsPRICE: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
      DisplayFormat = '#.00'
    end
  end
  object dsProduct: TDataSource
    DataSet = fdqProduct
    Left = 508
    Top = 313
  end
  object fdqProduct: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT *'
      'FROM MFPRODUCT')
    Left = 564
    Top = 313
    object fdqProductIDPRODUCT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDPRODUCT'
      Origin = 'IDPRODUCT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqProductNAMEPRODUCT: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NAMEPRODUCT'
      Origin = 'NAMEPRODUCT'
      Required = True
      Size = 50
    end
    object fdqProductDESCRIPTIONPRODUCT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRIPTIONPRODUCT'
      Origin = 'DESCRIPTIONPRODUCT'
      Size = 100
    end
    object fdqProductPRICE: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRICE'
      Origin = 'PRICE'
    end
  end
  object frxReport: TfrxReport
    Version = '2024.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45559.120069120400000000
    ReportOptions.LastChange = 45559.476772407400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 428
    Top = 81
    Datasets = <
      item
        DataSet = frxReportOrders
        DataSetName = 'frxReportOrders'
      end
      item
        DataSet = frxReportOrdersItems
        DataSetName = 'frxReportOrdersItems'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 311.811224630000000000
          Top = 3.779531070000000000
          Width = 94.488250730000000000
          Height = 26.456707860000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pedidos')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 434.645950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 521.575140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        DataSet = frxReportOrders
        DataSetName = 'frxReportOrders'
        RowCount = 0
        object frxReportOrdersIDORDER: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677177600000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'IDORDER'
          DataSet = frxReportOrders
          DataSetName = 'frxReportOrders'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxReportOrders."IDORDER"]')
        end
        object frxReportOrdersDTORDER: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 531.016080000000000000
          Top = 22.677177600000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DTORDER'
          DataSet = frxReportOrders
          DataSetName = 'frxReportOrders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxReportOrders."DTORDER"]')
          ParentFont = False
        end
        object frxReportOrdersNAMECLIENT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 98.708720000000000000
          Top = 22.677177600000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NAMECLIENT'
          DataSet = frxReportOrders
          DataSetName = 'frxReportOrders'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxReportOrders."NAMECLIENT"]')
        end
        object frxReportOrdersTOTALPRICE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 428.189240000000000000
          Top = 22.677177600000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TOTALPRICE'
          DataSet = frxReportOrders
          DataSetName = 'frxReportOrders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxReportOrders."TOTALPRICE"]')
          ParentFont = False
        end
        object frxReportOrdersTELEPHONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 311.362400000000000000
          Top = 22.677177600000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TELEPHONE'
          DataSet = frxReportOrders
          DataSetName = 'frxReportOrders'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxReportOrders."TELEPHONE"]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530190000000000
          Width = 18.897648830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ID')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 98.708720000000000000
          Width = 49.133888830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 311.362400000000000000
          Width = 60.472478830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 431.968771170000000000
          Width = 75.590598830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o Total')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 576.370441170000000000
          Width = 34.015768830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 50.031540000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = frxReportOrdersItems
        DataSetName = 'frxReportOrdersItems'
        RowCount = 0
        object frxReportOrdersItemsIDORDER_ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 46.338590000000000000
          Top = 2.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'IDORDER_ITEM'
          DataSet = frxReportOrdersItems
          DataSetName = 'frxReportOrdersItems'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxReportOrdersItems."IDORDER_ITEM"]')
          ParentFont = False
        end
        object frxReportOrdersItemsIDPRODUCT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.897650000000000000
          Top = 29.354360000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NAMEPRODUCT'
          DataSet = frxReportOrdersItems
          DataSetName = 'frxReportOrdersItems'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxReportOrdersItems."NAMEPRODUCT"]')
          ParentFont = False
        end
        object frxReportOrdersItemsAMOUNT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 447.291590000000000000
          Top = 29.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'AMOUNT'
          DataSet = frxReportOrdersItems
          DataSetName = 'frxReportOrdersItems'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxReportOrdersItems."AMOUNT"]')
          ParentFont = False
        end
        object frxReportOrdersItemsPRICE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 614.913730000000000000
          Top = 31.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'PRICE'
          DataSet = frxReportOrdersItems
          DataSetName = 'frxReportOrdersItems'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxReportOrdersItems."PRICE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530190000000000
          Top = 2.897650000000000000
          Width = 18.897648830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ID')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530190000000000
          Top = 30.236240000000010000
          Width = 60.472478830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 345.141931170000000000
          Top = 30.236240000000000000
          Width = 79.370128830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 550.779841170000000000
          Top = 30.236240000000000000
          Width = 41.574828830000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 432.173499790000000000
          Top = 3.779545740000000000
          Width = 94.488220210000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxReportOrdersItems."AMOUNT">,DetailData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 599.795639790000000000
          Top = 3.779545740000000000
          Width = 94.488220210000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'R$ [SUM(<frxReportOrdersItems."PRICE">,DetailData1)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530190000000000
          Top = 3.779515220000008000
          Width = 94.488248830000000000
          Height = 18.897674560000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
    end
  end
  object frxReportOrders: TfrxDBDataset
    UserName = 'frxReportOrders'
    CloseDataSource = False
    DataSet = fdpReportOrders
    BCDToCurrency = False
    DataSetOptions = []
    Left = 364
    Top = 137
    FieldDefs = <
      item
        FieldName = 'IDORDER'
      end
      item
        FieldName = 'IDCLIENT'
      end
      item
        FieldName = 'DTORDER'
      end
      item
        FieldName = 'TOTALPRICE'
      end
      item
        FieldName = 'NAMECLIENT'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'TELEPHONE'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'ADDRESSCLIENT'
        FieldType = fftString
        Size = 100
      end>
  end
  object dsReportOrders: TDataSource
    DataSet = fdpReportOrders
    Left = 364
    Top = 193
  end
  object fdpReportOrders: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'SELECT O.IDORDER, O.IDCLIENT, O.DTORDER, O.TOTALPRICE, C.NAMECLI' +
        'ENT, C.TELEPHONE, ADDRESSCLIENT'
      'FROM MFORDERS O '
      'JOIN MFCLIENT C ON O.IDCLIENT = C.IDCLIENT')
    Left = 428
    Top = 193
    object fdpReportOrdersIDORDER: TFDAutoIncField
      FieldName = 'IDORDER'
      Origin = 'IDORDER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdpReportOrdersIDCLIENT: TIntegerField
      FieldName = 'IDCLIENT'
      Origin = 'IDCLIENT'
      Required = True
    end
    object fdpReportOrdersDTORDER: TSQLTimeStampField
      FieldName = 'DTORDER'
      Origin = 'DTORDER'
    end
    object fdpReportOrdersTOTALPRICE: TFloatField
      FieldName = 'TOTALPRICE'
      Origin = 'TOTALPRICE'
      DisplayFormat = 'R$ #.00'
    end
    object fdpReportOrdersNAMECLIENT: TStringField
      FieldName = 'NAMECLIENT'
      Origin = 'NAMECLIENT'
      Required = True
      Size = 50
    end
    object fdpReportOrdersTELEPHONE: TStringField
      FieldName = 'TELEPHONE'
      Origin = 'TELEPHONE'
      Size = 30
    end
    object fdpReportOrdersADDRESSCLIENT: TStringField
      FieldName = 'ADDRESSCLIENT'
      Origin = 'ADDRESSCLIENT'
      Size = 100
    end
  end
  object fdqReportOrdersItems: TFDQuery
    Active = True
    CachedUpdates = True
    IndexFieldNames = 'IDORDER'
    MasterSource = dsReportOrders
    MasterFields = 'IDORDER'
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'SELECT O.IDORDER_ITEM,O.IDORDER, O.IDPRODUCT, O.AMOUNT, O.PRICE,' +
        ' P.NAMEPRODUCT, P.DESCRIPTIONPRODUCT'
      'FROM MFORDERS_ITEMS O '
      'JOIN MFPRODUCT P ON P.IDPRODUCT = O.IDPRODUCT'
      'WHERE O.IDORDER = :IDORDER')
    Left = 428
    Top = 249
    ParamData = <
      item
        Name = 'IDORDER'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 2
      end>
    object fdqReportOrdersItemsIDORDER_ITEM: TFDAutoIncField
      FieldName = 'IDORDER_ITEM'
      Origin = 'IDORDER_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqReportOrdersItemsIDORDER: TIntegerField
      FieldName = 'IDORDER'
      Origin = 'IDORDER'
      Required = True
    end
    object fdqReportOrdersItemsIDPRODUCT: TIntegerField
      FieldName = 'IDPRODUCT'
      Origin = 'IDPRODUCT'
      Required = True
    end
    object fdqReportOrdersItemsAMOUNT: TIntegerField
      FieldName = 'AMOUNT'
      Origin = 'AMOUNT'
      Required = True
    end
    object fdqReportOrdersItemsPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
      DisplayFormat = 'R$ #.00'
    end
    object fdqReportOrdersItemsNAMEPRODUCT: TStringField
      FieldName = 'NAMEPRODUCT'
      Origin = 'NAMEPRODUCT'
      Required = True
      Size = 50
    end
    object fdqReportOrdersItemsDESCRIPTIONPRODUCT: TStringField
      FieldName = 'DESCRIPTIONPRODUCT'
      Origin = 'DESCRIPTIONPRODUCT'
      Size = 100
    end
  end
  object dsReportOrdersItems: TDataSource
    DataSet = fdqReportOrdersItems
    Left = 364
    Top = 249
  end
  object frxReportOrdersItems: TfrxDBDataset
    UserName = 'frxReportOrdersItems'
    CloseDataSource = False
    DataSet = fdqReportOrdersItems
    BCDToCurrency = False
    DataSetOptions = []
    Left = 436
    Top = 137
    FieldDefs = <
      item
        FieldName = 'IDORDER_ITEM'
      end
      item
        FieldName = 'IDORDER'
      end
      item
        FieldName = 'IDPRODUCT'
      end
      item
        FieldName = 'AMOUNT'
      end
      item
        FieldName = 'PRICE'
      end
      item
        FieldName = 'NAMEPRODUCT'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'DESCRIPTIONPRODUCT'
        FieldType = fftString
        Size = 100
      end>
  end
end
