object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Minerva Foods'
  ClientHeight = 351
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmMain: TMainMenu
    Left = 320
    Top = 120
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object miClient: TMenuItem
        Caption = 'Clientes'
        OnClick = miClientClick
      end
      object miProducts: TMenuItem
        Caption = 'Produtos'
        OnClick = miProductsClick
      end
    end
    object Operao1: TMenuItem
      Caption = 'Opera'#231#227'o'
      object miOrders: TMenuItem
        Caption = 'Pedidos'
        OnClick = miOrdersClick
      end
    end
  end
end
