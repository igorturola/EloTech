object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 247
  ClientWidth = 577
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 64
    Top = 32
    object CadastrodeAlunos1: TMenuItem
      Caption = 'Cadastro de Alunos'
      OnClick = CadastrodeAlunos1Click
    end
    object CadastroProfessor1: TMenuItem
      Caption = 'Cadastro Professor'
      OnClick = CadastroProfessor1Click
    end
  end
end
