unit FrmCadastroProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXFirebird, Data.DB,
  Datasnap.DBClient, SimpleDS, Data.SqlExpr, FrmLancamentoNota;

type
  TCadastroProfessor = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNomeProfessor: TEdit;
    edtCpf: TEdit;
    edtSexo: TEdit;
    edtDataNascimento: TEdit;
    edtEmail: TEdit;
    edtDisciplina: TEdit;
    edtConfirmar: TButton;
    btnLancarNota: TButton;
    banco: TSQLConnection;
    teste: TSimpleDataSet;
    btnPesquisa: TButton;
    Pesquisa: TSimpleDataSet;
    PesquisaCD_PROFESSOR: TIntegerField;
    PesquisaNOME: TStringField;
    PesquisaCPF: TStringField;
    PesquisaSEXO: TStringField;
    PesquisaDATA_NASCIMENTO: TStringField;
    PesquisaEMAIL: TStringField;
    PesquisaDISCIPLINA: TStringField;
    edtcodigo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConfirmarClick(Sender: TObject);
    procedure btnLancarNotaClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtNomeProfessorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    COMANDO_SQL: String;
  end;

var
  CadastroProfessor: TCadastroProfessor;

implementation

{$R *.dfm}

procedure TCadastroProfessor.btnLancarNotaClick(Sender: TObject);
begin
  if Trim(edtNomeProfessor.Text) <> '' then
  begin
    Application.CreateForm(TFrmLancNota, FrmLancNota);
    FrmLancNota.edtCodigoProfessor.Text := edtcodigo.Text;
    FrmLancNota.edtProfessor.Text := edtNomeProfessor.Text;
    FrmLancNota.edtDisciplina.Text := edtDisciplina.Text;
    FrmLancNota.ShowModal;
  end
  else
    ShowMessage('Não é possível lançar notas sem professor pesquisado');
end;

procedure TCadastroProfessor.btnPesquisaClick(Sender: TObject);
begin
  if edtNomeProfessor.Text <> '' then
  begin

    Pesquisa.Active := False;
    COMANDO_SQL :=
      'SELECT  CD_PROFESSOR, NOME, CPF, SEXO, DATA_NASCIMENTO, EMAIL, DISCIPLINA '
      + #13 + 'FROM PROFESSOR                                    ' + #13 +
      'WHERE NOME LIKE ' + QuotedStr('%' + edtNomeProfessor.Text + '%');
    Pesquisa.DataSet.CommandText := COMANDO_SQL;
    Pesquisa.Active := True;

    edtcodigo.Text := IntToStr(PesquisaCD_PROFESSOR.AsInteger);
    edtNomeProfessor.Text := PesquisaNOME.AsString;
    edtCpf.Text := PesquisaCPF.AsString;
    edtSexo.Text := PesquisaSEXO.AsString;
    edtDataNascimento.Text := PesquisaDATA_NASCIMENTO.AsString;
    edtEmail.Text := PesquisaEMAIL.AsString;
    edtDisciplina.Text := PesquisaDISCIPLINA.Text;
  end;
end;

procedure TCadastroProfessor.edtConfirmarClick(Sender: TObject);
begin
  if edtNomeProfessor.Text <> '' then
  begin
    TRY

      COMANDO_SQL := 'INSERT INTO PROFESSOR ' + #13 +
        '(NOME, CPF,SEXO,DATA_NASCIMENTO,EMAIL,DISCIPLINA)' + 'VALUES  (' +
        QuotedStr(edtNomeProfessor.Text) + ',' + #13 + QuotedStr(edtCpf.Text) +
        ',' + #13 + QuotedStr(edtSexo.Text) + ',' + #13 +
        QuotedStr(edtDataNascimento.Text) + ',' + #13 + QuotedStr(edtEmail.Text)
        + ',' + #13 + QuotedStr(edtDisciplina.Text) + ')';

      teste.DataSet.CommandText := COMANDO_SQL;
      teste.Execute;

      edtNomeProfessor.Clear;
      edtCpf.Clear;
      edtSexo.Clear;
      edtDataNascimento.Clear;
      edtEmail.Clear;
      edtDisciplina.Clear;

      ShowMessage('Dados Incluidos com Sucesso!!!!');

    EXCEPT
      ON e: exception do
      begin
        ShowMessage('Erro na Inclusão, Erro' + e.Message);
      end;

    END;
  end
  else
    ShowMessage('Preencha ao menos o nome do Professor');
end;

procedure TCadastroProfessor.edtNomeProfessorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    btnPesquisaClick(Sender);
end;

procedure TCadastroProfessor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  CadastroProfessor := nil;
end;

end.
