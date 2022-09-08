unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrmCadastroAluno, Vcl.Menus,
  FrmCadastroProfessor;

type
  TPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastrodeAlunos1: TMenuItem;
    CadastroProfessor1: TMenuItem;
    procedure CadastrodeAlunos1Click(Sender: TObject);
    procedure CadastroProfessor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.CadastrodeAlunos1Click(Sender: TObject);
begin
  Application.CreateForm(TCadastroAluno, CadastroAluno);
  CadastroAluno.ShowModal;
end;

procedure TPrincipal.CadastroProfessor1Click(Sender: TObject);
begin
  Application.CreateForm(TCadastroProfessor, CadastroProfessor);
  CadastroProfessor.ShowModal;
end;

end.
