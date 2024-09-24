inherited frmProducts: TfrmProducts
  Caption = 'Cadastro de Produtos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBase: TPageControl
    ExplicitTop = 49
    ExplicitHeight = 395
    inherited tsShearch: TTabSheet
      ExplicitHeight = 367
      inherited Panel4: TPanel
        ExplicitTop = 0
      end
    end
    inherited tsDetails: TTabSheet
      ExplicitHeight = 367
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 27
        Height = 13
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 50
        Height = 21
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'IDPRODUCT'
        DataSource = dsMain
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 500
        Height = 21
        DataField = 'NAMEPRODUCT'
        DataSource = dsMain
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 104
        Width = 500
        Height = 21
        DataField = 'DESCRIPTIONPRODUCT'
        DataSource = dsMain
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 144
        Width = 134
        Height = 21
        DataField = 'PRICE'
        DataSource = dsMain
        TabOrder = 3
        OnKeyPress = DBEdit4KeyPress
      end
    end
  end
  inherited fdqSearch: TFDQuery
    SQL.Strings = (
      'SELECT * FROM MFPRODUCT')
    object fdqSearchIDPRODUCT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDPRODUCT'
      Origin = 'IDPRODUCT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSearchNAMEPRODUCT: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NAMEPRODUCT'
      Origin = 'NAMEPRODUCT'
      Required = True
      Size = 50
    end
    object fdqSearchDESCRIPTIONPRODUCT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRIPTIONPRODUCT'
      Origin = 'DESCRIPTIONPRODUCT'
      Size = 100
    end
    object fdqSearchPRICE: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRICE'
      Origin = 'PRICE'
    end
  end
  inherited fdqMain: TFDQuery
    SQL.Strings = (
      'SELECT * FROM MFPRODUCT WHERE IDPRODUCT = :IDPRODUCT')
    ParamData = <
      item
        Name = 'IDPRODUCT'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdqMainIDPRODUCT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDPRODUCT'
      Origin = 'IDPRODUCT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqMainNAMEPRODUCT: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NAMEPRODUCT'
      Origin = 'NAMEPRODUCT'
      Required = True
      Size = 50
    end
    object fdqMainDESCRIPTIONPRODUCT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRIPTIONPRODUCT'
      Origin = 'DESCRIPTIONPRODUCT'
      Size = 100
    end
    object fdqMainPRICE: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRICE'
      Origin = 'PRICE'
      DisplayFormat = '#.00'
    end
  end
end
