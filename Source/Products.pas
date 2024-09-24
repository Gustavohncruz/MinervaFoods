unit Products;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmProducts = class(TfrmBase)
    fdqSearchIDPRODUCT: TFDAutoIncField;
    fdqSearchNAMEPRODUCT: TStringField;
    fdqSearchDESCRIPTIONPRODUCT: TStringField;
    fdqSearchPRICE: TFloatField;
    fdqMainIDPRODUCT: TFDAutoIncField;
    fdqMainNAMEPRODUCT: TStringField;
    fdqMainDESCRIPTIONPRODUCT: TStringField;
    fdqMainPRICE: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProducts: TfrmProducts;

implementation

{$R *.dfm}

procedure TfrmProducts.btnSearchClick(Sender: TObject);
begin
    _WhereFilter :=
    '     (IDPRODUCT = %d ) OR '+
    '     (NAMEPRODUCT LIKE %s ) OR '+
    '     (DESCRIPTIONPRODUCT LIKE %s ) ';

  _WhereFilter := Format( _WhereFilter,
                        [ StrToIntDef( edSearch.Text ,0),
                          QuotedStr( '%' + edSearch.Text + '%' ),
                          QuotedStr( '%' + edSearch.Text + '%' )
                        ] );
  inherited;

end;

procedure TfrmProducts.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8, #13, ',']) then
    key := #0;
end;

procedure TfrmProducts.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//
end;

procedure TfrmProducts.FormCreate(Sender: TObject);
begin
  inherited;
  _SQLMain := 'SELECT * FROM MFPRODUCT WHERE IDPRODUCT = :IDPRODUCT';
  _SQLSearch := 'SELECT * FROM MFPRODUCT %s';
  _PrimaryKey := 'IDPRODUCT';
end;

end.
