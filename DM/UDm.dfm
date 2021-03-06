object DM: TDM
  OldCreateOrder = False
  Height = 452
  Width = 725
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 72
    Top = 416
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 152
    Top = 400
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 392
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=gestor_financeiro'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object DS_tbUsuario: TDataSource
    DataSet = FQ_tbUsuario
    Left = 104
    Top = 120
  end
  object FQ_tbUsuario: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'Select * From tb_usuario')
    Left = 176
    Top = 120
    object FQ_tbUsuarioId: TFDAutoIncField
      DisplayLabel = 'N'#186' Registro'
      FieldName = 'Id'
      ReadOnly = True
    end
    object FQ_tbUsuarioNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 40
    end
    object FQ_tbUsuarioSobreNome: TStringField
      FieldName = 'SobreNome'
      Required = True
      Size = 40
    end
    object FQ_tbUsuarioLogin: TStringField
      FieldName = 'Login'
      Required = True
    end
    object FQ_tbUsuarioSenha: TStringField
      FieldName = 'Senha'
      Required = True
    end
    object FQ_tbUsuarioData_Cadastro: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'Data_Cadastro'
    end
    object FQ_tbUsuarioHora_Cadastro: TTimeField
      DisplayLabel = 'Hora do Cadastro'
      FieldName = 'Hora_Cadastro'
    end
    object FQ_tbUsuarioData_Nascimento: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'Data_Nascimento'
    end
    object FQ_tbUsuarioUsuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usuario'
    end
    object FQ_tbUsuarioStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
  end
  object FT_tbUsuario: TFDTable
    Active = True
    IndexFieldNames = 'Id'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'gestor_financeiro.tb_usuario'
    TableName = 'gestor_financeiro.tb_usuario'
    Left = 24
    Top = 120
    object FT_tbUsuarioId: TFDAutoIncField
      DisplayLabel = 'N'#186' Registro'
      FieldName = 'Id'
      Origin = 'Id'
      ReadOnly = True
    end
    object FT_tbUsuarioNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 40
    end
    object FT_tbUsuarioSobreNome: TStringField
      FieldName = 'SobreNome'
      Origin = 'SobreNome'
      Required = True
      Size = 40
    end
    object FT_tbUsuarioLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
    end
    object FT_tbUsuarioSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Required = True
    end
    object FT_tbUsuarioData_Cadastro: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'Data_Cadastro'
      Origin = 'Data_Cadastro'
    end
    object FT_tbUsuarioHora_Cadastro: TTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Hora do Cadastro'
      FieldName = 'Hora_Cadastro'
      Origin = 'Hora_Cadastro'
    end
    object FT_tbUsuarioData_Nascimento: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'Data_Nascimento'
      Origin = 'Data_Nascimento'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object FT_tbUsuarioUsuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Usuario'
      Origin = 'Usuario'
    end
    object FT_tbUsuarioStatus: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Status'
      Origin = 'Status'
      Size = 1
    end
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Jefferson Souza\Documents\Embarcadero\Studio\Projects\G' +
      'estor Pessoal\Lib\libmySQL.dll'
    Left = 168
    Top = 16
  end
  object FQ_tbConta: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * from tb_conta')
    Left = 168
    Top = 200
    object FQ_tbContaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FQ_tbContaNome_Banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome_Banco'
      Origin = 'Nome_Banco'
      Size = 50
    end
    object FQ_tbContaCodigo_Banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Codigo_Banco'
      Origin = 'Codigo_Banco'
      Size = 50
    end
  end
  object DS_tbConta: TDataSource
    DataSet = FQ_tbConta
    Left = 96
    Top = 200
  end
  object FT_tbConta: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'gestor_financeiro.tb_conta'
    TableName = 'gestor_financeiro.tb_conta'
    Left = 24
    Top = 200
    object FT_tbContaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FT_tbContaNome_Banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome_Banco'
      Origin = 'Nome_Banco'
      Size = 50
    end
    object FT_tbContaCodigo_Banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Codigo_Banco'
      Origin = 'Codigo_Banco'
      Size = 50
    end
  end
end
