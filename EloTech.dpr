program EloTech;

uses
  Vcl.Forms,
  FrmCadastroAluno in 'FrmCadastroAluno.pas' {CadastroAluno},
  FrmPrincipal in 'FrmPrincipal.pas' {Principal},
  FrmCadastroProfessor in 'FrmCadastroProfessor.pas' {CadastroProfessor},
  FrmLancamentoNota in 'FrmLancamentoNota.pas' {FrmLancNota},
  Conexao in 'Conexao.pas' {FrmConexao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TFrmLancNota, FrmLancNota);
  Application.CreateForm(TFrmConexao, FrmConexao);
  Application.Run;
end.
