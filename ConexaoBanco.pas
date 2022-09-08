unit ConexaoBanco;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    Manutencao: TSimpleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
