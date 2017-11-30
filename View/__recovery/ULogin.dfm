object Frm_Login: TFrm_Login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Login'
  ClientHeight = 243
  ClientWidth = 320
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lb_Usuario: TLabel
    Left = 16
    Top = 51
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object lb_Senha: TLabel
    Left = 16
    Top = 107
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Edt_Login: TEdit
    Left = 120
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edt_Senha: TEdit
    Left = 120
    Top = 104
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Btn_Entrar: TButton
    Left = 166
    Top = 152
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = Btn_EntrarClick
  end
end
