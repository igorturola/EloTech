unit FrmLancamentoNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, SimpleDS, StrUtils, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, frxClass, frxDBSet, clipbrd, Vcl.Menus, ShellApi,
  Data.DBXFirebird, Data.SqlExpr, Conexao;

type
  TFrmLancNota = class(TForm)
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    edtNomeAluno: TEdit;
    edtSerie: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtProfessor: TEdit;
    edtDisciplina: TEdit;
    edtConfirmar: TButton;
    btnPesquisaAluno: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    edtPiorNota: TEdit;
    Label4: TLabel;
    edtMedia: TEdit;
    Label5: TLabel;
    edtAno: TEdit;
    Label6: TLabel;
    Sql: TSimpleDataSet;
    PesquisaAluno: TSimpleDataSet;
    PesquisaAlunoCD_ALUNO: TIntegerField;
    PesquisaAlunoNOME: TStringField;
    PesquisaAlunoSERIE: TStringField;
    edtCodigo: TEdit;
    edtCodigoProfessor: TEdit;
    edtnota1: TEdit;
    edtNota2: TEdit;
    edtNota3: TEdit;
    edtNota4: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Button1: TButton;
    PesquisaNota: TSimpleDataSet;
    PesquisaNotaNOTA_1: TSingleField;
    PesquisaNotaNOTA_2: TIntegerField;
    PesquisaNotaNOTA_3: TIntegerField;
    PesquisaNotaNOTA_4: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure btnPesquisaAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure edtConfirmarClick(Sender: TObject);
    procedure edtnota1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    COMANDO_SQL: String;
  end;

var
  FrmLancNota: TFrmLancNota;
  ClientNotas: TClientDataSet;
  DataSource: TDataSource;

implementation

{$R *.dfm}

procedure TFrmLancNota.btnPesquisaAlunoClick(Sender: TObject);
begin
  if edtNomeAluno.Text <> '' then
  begin

    PesquisaAluno.Active := False;
    COMANDO_SQL := 'SELECT CD_ALUNO, NOME, SERIE ' + #13 +
      'FROM ALUNO                                    ' + #13 +
      'WHERE NOME LIKE ' + QuotedStr('%' + edtNomeAluno.Text + '%');
    PesquisaAluno.DataSet.CommandText := COMANDO_SQL;
    PesquisaAluno.Active := True;

    edtNomeAluno.Text := PesquisaAlunoNOME.AsString;
    edtSerie.Text := PesquisaAlunoSERIE.AsString;
    edtCodigo.Text := IntToStr(PesquisaAlunoCD_ALUNO.AsInteger);
    edtAno.SetFocus;
  end;
end;

procedure TFrmLancNota.Button1Click(Sender: TObject);
var Media : string;
begin
  FrmLancNota.GroupBox2.Height := 215;

end;

procedure TFrmLancNota.Button2Click(Sender: TObject);
begin
  FrmLancNota.Close;
end;

procedure TFrmLancNota.edtConfirmarClick(Sender: TObject);
begin
  if edtNomeAluno.Text <> '' then
  begin
    TRY

      COMANDO_SQL := 'INSERT INTO ALUNO_PROFESSOR ' + #13 +
        '(ANO, CD_ALUNO,CD_PROFESSOR,NOTA_1, NOTA_2, NOTA_3, NOTA_4)' +
        'VALUES  ( ' + QuotedStr(edtAno.Text) + ',' + #13 +
        QuotedStr(edtCodigo.Text) + ',' + #13 +
        QuotedStr(edtCodigoProfessor.Text) + ',' + #13 +
        AnsiReplaceStr(FormatFloat('#.00', StrToFloat(edtnota1.Text)), ',', '.')
        + ',' + #13 + AnsiReplaceStr(FormatFloat('#.00',
        StrToFloat(edtNota2.Text)), ',', '.') + ',' + #13 +
        AnsiReplaceStr(FormatFloat('#.00', StrToFloat(edtNota3.Text)), ',', '.')
        + ',' + #13 + AnsiReplaceStr(FormatFloat('#.00',
        StrToFloat(edtNota4.Text)), ',', '.') + ')';

      Sql.DataSet.CommandText := COMANDO_SQL;
      Sql.Execute;
      ShowMessage('Dados Incluidos com Sucesso!!!!');
    EXCEPT
      ON e: exception do
      begin
        ShowMessage('Erro na Inclusão, Erro' + e.Message);
      END;

    END;
  end
  else
    ShowMessage

      ('Preencha ao menos o nome do Professor e do Aluno');
end;

procedure TFrmLancNota.edtNomeAlunoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    btnPesquisaAlunoClick(Sender);
end;

procedure TFrmLancNota.edtnota1Exit(Sender: TObject);
begin

  edtnota1.Text := FormatFloat('###,###0.00', StrToFloat(edtnota1.Text));
end;

procedure TFrmLancNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  FrmLancNota := nil;
end;

procedure TFrmLancNota.FormShow(Sender: TObject);
begin
  ClientNotas := TClientDataSet.Create(nil);

  ClientNotas.FieldDefs.Add('1º Bimestre', ftFloat);
  ClientNotas.FieldDefs.Add('2º Bimestre', ftFloat);
  ClientNotas.FieldDefs.Add('3º Bimestre', ftFloat);
  ClientNotas.FieldDefs.Add('4º Bimestre', ftFloat);

  ClientNotas.CreateDataSet;
  DataSource := TDataSource.Create(Self);

end;

end.
