unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    mmMain: TMainMenu;
    Cadastros1: TMenuItem;
    Operao1: TMenuItem;
    miClient: TMenuItem;
    miProducts: TMenuItem;
    miOrders: TMenuItem;
    procedure miClientClick(Sender: TObject);
    procedure miProductsClick(Sender: TObject);
    procedure miOrdersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Orders, Clients, Products;

{$R *.dfm}

procedure TfrmMain.miClientClick(Sender: TObject);
begin
  try
    frmClient := TfrmClient.Create(Application);
    frmClient.ShowModal;
  finally
    FreeAndNil(frmClient);
  end;
end;

procedure TfrmMain.miOrdersClick(Sender: TObject);
begin
  try
    frmOrders := TfrmOrders.Create(Application);
    frmOrders.ShowModal;
  finally
    FreeAndNil(frmOrders);
  end;
end;

procedure TfrmMain.miProductsClick(Sender: TObject);
begin
  try
    frmProducts := TfrmProducts.Create(Application);
    frmProducts.ShowModal;
  finally
    FreeAndNil(frmProducts);
  end;
end;

end.
