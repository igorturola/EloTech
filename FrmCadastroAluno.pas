unit FrmCadastroAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ConexaoBanco,
  Data.DBXFirebird, Data.DB, Datasnap.DBClient, SimpleDS, Data.SqlExpr;

type
  TCadastroAluno = class(TForm)
    GroupBox1: TGroupBox;
    edtNomeAluno: TEdit;
    btnConfirmar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtCpf: TEdit;
    Label3: TLabel;
    edtSexo: TEdit;
    edtDataNascimento: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtEmail: TEdit;
    edtSerie: TEdit;
    Label6: TLabel;
    teste: TSimpleDataSet;
    banco: TSQLConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  CadastroAluno: TCadastroAluno;

implementation

{$R *.dfm}

procedure TCadastroAluno.btnConfirmarClick(Sender: TObject);
var
  var_SQL: String;
begin
  if edtNomeAluno.Text <> '' then
  begin

    TRY

      var_SQL := 'INSERT into ALUNO ' + #13 +
        '(NOME, CPF,SEXO,DATA_NASCIMENTO,EMAIL,SERIE)' + 'VALUES  (' +
        QuotedStr(edtNomeAluno.Text) + ',' + #13 +
        QuotedStr(edtCpf.Text)       + ',' + #13 +
        QuotedStr(edtSexo.Text) + ',' + #13 +
        QuotedStr(edtDataNascimento.Text) + ',' + #13 + QuotedStr(edtEmail.Text)
        + ',' + #13 + QuotedStr(edtSerie.Text) + ')';

      teste.DataSet.CommandText := var_SQL;
      teste.Execute;

      ShowMessage('Dados Incluidos com Sucesso!!!!');

      edtNomeAluno.Clear;
      edtCpf.Clear;
      edtSexo.Clear;
      edtDataNascimento.Clear;
      edtEmail.Clear;
      edtSerie.Clear;

    EXCEPT
      ON e: exception do
      begin
        ShowMessage('Erro na Inclusão, Erro' + e.Message);
      end;

    END;
  end
  else
    ShowMessage('Preencha ao menos o nome do Aluno');
end;

procedure TCadastroAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  CadastroAluno := nil;
end;

procedure LimpaDados;
begin

end;

end.
