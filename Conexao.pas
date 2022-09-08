unit Conexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXFirebird, Data.DB, Data.SqlExpr;

type
  TFrmConexao = class(TForm)
    banco: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

{$R *.dfm}

end.
