program ConsoleMinervaFoods;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Base in 'Util\Base.pas' {frmBase},
  DMBase in 'Util\DMBase.pas' {DM: TDataModule},
  Clients in 'Clients.pas' {frmClient},
  Products in 'Products.pas' {frmProducts},
  Orders in 'Orders.pas' {frmOrders},
  Functions in 'Util\Functions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
