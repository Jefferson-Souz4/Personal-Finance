object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 510
  Width = 674
  object SQLConnection: TSQLConnection
    ConnectionName = 'gerenciador_financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'Password=123'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'HostName=localhost'
      'Database=gerenciador_financeiro'
      'User_Name=root')
    Left = 56
    Top = 32
  end
  object CDS_tb_User: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 208
    Top = 176
    object CDS_tb_UserId: TIntegerField
      DisplayLabel = 'N'#186' Registro'
      FieldName = 'Id'
      Required = True
    end
    object CDS_tb_UserNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object CDS_tb_UserSobreNome: TStringField
      FieldName = 'SobreNome'
      Required = True
      Size = 50
    end
    object CDS_tb_UserLogin: TStringField
      FieldName = 'Login'
      Required = True
    end
    object CDS_tb_UserSenha: TStringField
      FieldName = 'Senha'
      Required = True
    end
    object CDS_tb_UserStatus: TStringField
      FieldName = 'Status'
      Required = True
      Size = 1
    end
    object CDS_tb_UserData_Cadastro: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'Data_Cadastro'
    end
    object CDS_tb_UserHora_Cadastro: TTimeField
      DisplayLabel = 'Hora do Cadastro'
      FieldName = 'Hora_Cadastro'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 176
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'Select * From tb_user'
    DbxCommandType = ''
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 32
    Top = 176
    object SQLDataSet1Id: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object SQLDataSet1Nome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object SQLDataSet1SobreNome: TStringField
      FieldName = 'SobreNome'
      Required = True
      Size = 50
    end
    object SQLDataSet1Login: TStringField
      FieldName = 'Login'
      Required = True
    end
    object SQLDataSet1Senha: TStringField
      FieldName = 'Senha'
      Required = True
    end
    object SQLDataSet1Status: TStringField
      FieldName = 'Status'
      Required = True
      Size = 1
    end
    object SQLDataSet1Data_Cadastro: TDateField
      FieldName = 'Data_Cadastro'
    end
    object SQLDataSet1Hora_Cadastro: TTimeField
      FieldName = 'Hora_Cadastro'
    end
  end
  object FdConctn: TFDConnection
    Params.Strings = (
      'Database=gerenciador_financeiro'
      'User_Name=root'
      'Password=123'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 464
    Top = 32
  end
  object DStb_user: TDataSource
    DataSet = Fdtb_user
    Left = 552
    Top = 40
  end
  object SQLtb_user: TFDQuery
    Connection = FdConctn
    Left = 464
    Top = 128
  end
  object Fdtb_user: TFDTable
    Connection = FdConctn
    UpdateOptions.UpdateTableName = 'gerenciador_financeiro.tb_user'
    TableName = 'gerenciador_financeiro.tb_user'
    Left = 560
    Top = 128
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Jefferson Souza\Documents\Embarcadero\Studio\Projects\G' +
      'estor Pessoal\Lib\libmySQL.dll'
    Left = 624
    Top = 40
  end
end
