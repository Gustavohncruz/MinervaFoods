inherited frmClient: TfrmClient
  Caption = 'Cadastro de Clientes'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBase: TPageControl
    inherited tsShearch: TTabSheet
      inherited dbgSearch: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'IDCLIENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAMECLIENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEPHONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADDRESSCLIENT'
            Visible = True
          end>
      end
    end
    inherited tsDetails: TTabSheet
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
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbeTelphone
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = dbeEmail
      end
      object Label5: TLabel
        Left = 16
        Top = 168
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 50
        Height = 21
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'IDCLIENT'
        DataSource = dsMain
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 500
        Height = 21
        DataField = 'NAMECLIENT'
        DataSource = dsMain
        TabOrder = 1
      end
      object dbeTelphone: TDBEdit
        Left = 16
        Top = 104
        Width = 200
        Height = 21
        DataField = 'TELEPHONE'
        DataSource = dsMain
        TabOrder = 2
        OnExit = dbeTelphoneExit
        OnKeyPress = dbeTelphoneKeyPress
      end
      object dbeEmail: TDBEdit
        Left = 16
        Top = 144
        Width = 300
        Height = 21
        DataField = 'EMAIL'
        DataSource = dsMain
        TabOrder = 3
        OnExit = dbeEmailExit
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 184
        Width = 500
        Height = 21
        DataField = 'ADDRESSCLIENT'
        DataSource = dsMain
        TabOrder = 4
      end
    end
  end
  inherited fdqSearch: TFDQuery
    SQL.Strings = (
      'SELECT * FROM MFCLIENT')
    object fdqSearchIDCLIENT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDCLIENT'
      Origin = 'IDCLIENT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSearchNAMECLIENT: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NAMECLIENT'
      Origin = 'NAMECLIENT'
      Required = True
      Size = 50
    end
    object fdqSearchTELEPHONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEPHONE'
      Origin = 'TELEPHONE'
      Size = 30
    end
    object fdqSearchEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object fdqSearchADDRESSCLIENT: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ADDRESSCLIENT'
      Origin = 'ADDRESSCLIENT'
      Size = 100
    end
  end
  inherited fdqMain: TFDQuery
    SQL.Strings = (
      'SELECT * FROM MFCLIENT WHERE IDCLIENT = :IDCLIENT')
    ParamData = <
      item
        Name = 'IDCLIENT'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdqMainIDCLIENT: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'IDCLIENT'
      Origin = 'IDCLIENT'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqMainNAMECLIENT: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NAMECLIENT'
      Origin = 'NAMECLIENT'
      Required = True
      Size = 50
    end
    object fdqMainTELEPHONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEPHONE'
      Origin = 'TELEPHONE'
      EditMask = '(99) 9 9999-9999;0;_'
      Size = 30
    end
    object fdqMainEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object fdqMainADDRESSCLIENT: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ADDRESSCLIENT'
      Origin = 'ADDRESSCLIENT'
      Size = 100
    end
  end
end
