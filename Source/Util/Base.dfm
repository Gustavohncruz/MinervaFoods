object frmBase: TfrmBase
  Left = 0
  Top = 0
  ClientHeight = 444
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcBase: TPageControl
    Left = 0
    Top = 49
    Width = 660
    Height = 395
    ActivePage = tsShearch
    Align = alClient
    TabOrder = 0
    OnChange = pcBaseChange
    ExplicitTop = 41
    ExplicitHeight = 403
    object tsShearch: TTabSheet
      Caption = 'Pesquisar'
      ExplicitHeight = 416
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 49
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
        object btnSearch: TSpeedButton
          Left = 297
          Top = 8
          Width = 109
          Height = 22
          Caption = 'Pesquisar'
          OnClick = btnSearchClick
        end
        object edSearch: TEdit
          Left = 0
          Top = 8
          Width = 291
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = edSearchKeyPress
        end
      end
      object dbgSearch: TDBGrid
        Left = 0
        Top = 49
        Width = 652
        Height = 318
        Align = alClient
        DataSource = dsSearch
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgSearchDrawColumnCell
        OnDblClick = dbgSearchDblClick
        OnTitleClick = dbgSearchTitleClick
      end
    end
    object tsDetails: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitHeight = 416
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 49
    Align = alTop
    TabOrder = 1
    object btnInsert: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 49
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnInsertClick
    end
    object btnSave: TButton
      Left = 73
      Top = 0
      Width = 75
      Height = 49
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnDelete: TButton
      Left = 146
      Top = 0
      Width = 75
      Height = 49
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
  object dsSearch: TDataSource
    DataSet = fdqSearch
    Left = 500
    Top = 65
  end
  object fdqSearch: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      '')
    Left = 556
    Top = 65
  end
  object dsMain: TDataSource
    DataSet = fdqMain
    OnStateChange = dsMainStateChange
    Left = 500
    Top = 129
  end
  object fdqMain: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    Left = 556
    Top = 129
  end
end
