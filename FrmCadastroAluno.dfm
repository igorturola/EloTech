object CadastroAluno: TCadastroAluno
  Left = 0
  Top = 0
  Caption = 'Cadastro de Alunos'
  ClientHeight = 295
  ClientWidth = 417
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 242
    Caption = 'Dados Aluno'
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 13
      Top = 69
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label3: TLabel
      Left = 13
      Top = 117
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label4: TLabel
      Left = 13
      Top = 165
      Width = 81
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label5: TLabel
      Left = 213
      Top = 68
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label6: TLabel
      Left = 213
      Top = 117
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object edtNomeAluno: TEdit
      Left = 13
      Top = 36
      Width = 348
      Height = 21
      TabOrder = 0
    end
    object edtCpf: TEdit
      Left = 13
      Top = 82
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtSexo: TEdit
      Left = 13
      Top = 131
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtDataNascimento: TEdit
      Left = 13
      Top = 179
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 213
      Top = 82
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtSerie: TEdit
      Left = 213
      Top = 131
      Width = 121
      Height = 21
      TabOrder = 5
    end
  end
  object btnConfirmar: TButton
    Left = 296
    Top = 256
    Width = 113
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object teste: TSimpleDataSet
    Aggregates = <>
    Connection = banco
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 40
    Top = 328
  end
  object banco: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      
        'Database=C:\Users\Iogor Turola\Documents\Embarcadero\Studio\Proj' +
        'ects\Banco\Banco.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 104
    Top = 328
  end
end
