unit Clients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmClient = class(TfrmBase)
    fdqMainIDCLIENT: TFDAutoIncField;
    fdqMainNAMECLIENT: TStringField;
    fdqMainTELEPHONE: TStringField;
    fdqMainEMAIL: TStringField;
    fdqMainADDRESSCLIENT: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dbeTelphone: TDBEdit;
    Label4: TLabel;
    dbeEmail: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    fdqSearchIDCLIENT: TFDAutoIncField;
    fdqSearchNAMECLIENT: TStringField;
    fdqSearchTELEPHONE: TStringField;
    fdqSearchEMAIL: TStringField;
    fdqSearchADDRESSCLIENT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelphoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelphoneExit(Sender: TObject);
    procedure dbeEmailExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

uses Functions;

{$R *.dfm}

procedure TfrmClient.btnSearchClick(Sender: TObject);
begin
  _WhereFilter :=
    '     (IDCLIENT = %d ) OR '+
    '     (NAMECLIENT LIKE %s ) OR '+
    '     (TELEPHONE LIKE %s ) OR '+
    '     (ADDRESSCLIENT LIKE %s )  ';

  _WhereFilter := Format( _WhereFilter,
                        [ StrToIntDef( edSearch.Text ,0),
                          QuotedStr( '%' + edSearch.Text + '%' ),
                          QuotedStr( '%' + edSearch.Text + '%' ),
                          QuotedStr( '%' + edSearch.Text + '%' )
                        ] );
  inherited;

end;

procedure TfrmClient.dbeEmailExit(Sender: TObject);
begin
  inherited;
  if Trim(dbeEmail.Text) = '' then
    Exit;

  if not IsValidEmail(dbeEmail.Text) then
  begin
    dbeEmail.SetFocus;
    dbeEmail.SelectAll;
    Application.MessageBox(PChar('E-mail inv�lido'), 'Aten��o', MB_OK + MB_OK);
  end;
end;

procedure TfrmClient.dbeTelphoneExit(Sender: TObject);
begin
  inherited;
  if Trim(dbeTelphone.Text) = '' then
    Exit;

  if not IsValidCelular(dbeTelphone.Text) then
  begin
    dbeTelphone.SetFocus;
    dbeTelphone.SelectAll;
    Application.MessageBox(PChar('Telefone inv�lido'), 'Aten��o', MB_OK + MB_OK);
  end;
end;

procedure TfrmClient.dbeTelphoneKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8, #13]) then
    key := #0;
end;

procedure TfrmClient.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //
end;

procedure TfrmClient.FormCreate(Sender: TObject);
begin
  inherited;
  _SQLMain := 'SELECT * FROM MFCLIENT WHERE IDCLIENT = :IDCLIENT';
  _SQLSearch := 'SELECT * FROM MFCLIENT %s';
  _PrimaryKey := 'IDCLIENT';
end;

end.
