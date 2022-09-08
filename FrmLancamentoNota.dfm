object FrmLancNota: TFrmLancNota
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amento de Notas'
  ClientHeight = 383
  ClientWidth = 479
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 8
    Top = 134
    Width = 465
    Height = 155
    Caption = 'Dados Alunos'
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label7: TLabel
      Left = 13
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 13
      Top = 60
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Label3: TLabel
      Left = 13
      Top = 163
      Width = 58
      Height = 13
      Caption = 'Melhor Nota'
    end
    object Label4: TLabel
      Left = 118
      Top = 163
      Width = 44
      Height = 13
      Caption = 'Pior Nota'
    end
    object Label5: TLabel
      Left = 217
      Top = 163
      Width = 28
      Height = 13
      Caption = 'M'#233'dia'
    end
    object Label6: TLabel
      Left = 165
      Top = 60
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label8: TLabel
      Left = 14
      Top = 109
      Width = 76
      Height = 13
      Caption = 'Nota 1 Bimestre'
    end
    object Label9: TLabel
      Left = 110
      Top = 109
      Width = 50
      Height = 13
      Caption = '2 Bimestre'
    end
    object Label10: TLabel
      Left = 197
      Top = 109
      Width = 50
      Height = 13
      Caption = '3 Bimestre'
    end
    object Label12: TLabel
      Left = 293
      Top = 109
      Width = 50
      Height = 13
      Caption = '4 Bimestre'
    end
    object edtNomeAluno: TEdit
      Left = 13
      Top = 36
      Width = 348
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edtNomeAlunoKeyPress
    end
    object edtSerie: TEdit
      Left = 13
      Top = 74
      Width = 92
      Height = 21
      TabOrder = 1
    end
    object btnPesquisaAluno: TButton
      Left = 367
      Top = 34
      Width = 73
      Height = 25
      Caption = 'Pesquisa'
      TabOrder = 2
      OnClick = btnPesquisaAlunoClick
    end
    object Edit1: TEdit
      Left = 13
      Top = 176
      Width = 84
      Height = 21
      TabOrder = 3
    end
    object edtPiorNota: TEdit
      Left = 118
      Top = 176
      Width = 84
      Height = 21
      TabOrder = 4
    end
    object edtMedia: TEdit
      Left = 217
      Top = 176
      Width = 84
      Height = 21
      TabOrder = 5
    end
    object edtAno: TEdit
      Left = 165
      Top = 74
      Width = 68
      Height = 21
      TabOrder = 6
    end
    object edtCodigo: TEdit
      Left = -41
      Top = 47
      Width = 36
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      OnKeyPress = edtNomeAlunoKeyPress
    end
    object edtnota1: TEdit
      Left = 13
      Top = 122
      Width = 82
      Height = 21
      TabOrder = 8
      OnExit = edtnota1Exit
    end
    object edtNota2: TEdit
      Left = 110
      Top = 122
      Width = 68
      Height = 21
      TabOrder = 9
    end
    object edtNota3: TEdit
      Left = 197
      Top = 122
      Width = 68
      Height = 21
      TabOrder = 10
    end
    object edtNota4: TEdit
      Left = 293
      Top = 122
      Width = 68
      Height = 21
      TabOrder = 11
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 120
    Caption = 'Dados Professor'
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 13
      Top = 60
      Width = 43
      Height = 13
      Caption = 'Disciplina'
    end
    object edtProfessor: TEdit
      Left = 13
      Top = 36
      Width = 348
      Height = 21
      TabOrder = 0
    end
    object edtDisciplina: TEdit
      Left = 13
      Top = 74
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtCodigoProfessor: TEdit
      Left = -41
      Top = 33
      Width = 34
      Height = 21
      TabOrder = 2
    end
  end
  object edtConfirmar: TButton
    Left = 358
    Top = 350
    Width = 113
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = edtConfirmarClick
  end
  object Button1: TButton
    Left = 239
    Top = 350
    Width = 113
    Height = 25
    Caption = 'Desempenho Aluno'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Sql: TSimpleDataSet
    Aggregates = <>
    Connection = FrmConexao.banco
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 304
    Top = 8
  end
  object PesquisaAluno: TSimpleDataSet
    Aggregates = <>
    Connection = FrmConexao.banco
    DataSet.CommandText = 'select CD_ALUNO, NOME, SERIE from ALUNO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 360
    Top = 16
    object PesquisaAlunoCD_ALUNO: TIntegerField
      FieldName = 'CD_ALUNO'
      Required = True
    end
    object PesquisaAlunoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object PesquisaAlunoSERIE: TStringField
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object PesquisaNota: TSimpleDataSet
    Aggregates = <>
    Connection = FrmConexao.banco
    DataSet.CommandText = 'select NOTA_1, NOTA_2, NOTA_3, NOTA_4 from ALUNO_PROFESSOR'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 424
    Top = 24
    object PesquisaNotaNOTA_1: TSingleField
      FieldName = 'NOTA_1'
    end
    object PesquisaNotaNOTA_2: TIntegerField
      FieldName = 'NOTA_2'
    end
    object PesquisaNotaNOTA_3: TIntegerField
      FieldName = 'NOTA_3'
    end
    object PesquisaNotaNOTA_4: TIntegerField
      FieldName = 'NOTA_4'
    end
  end
end
