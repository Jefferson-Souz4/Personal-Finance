unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrm_Login = class(TForm)
    Edt_Login: TEdit;
    Edt_Senha: TEdit;
    lb_Usuario: TLabel;
    lb_Senha: TLabel;
    Btn_Entrar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_EntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

uses UUsuarios;

//----------------------Button Action-------------------------------------------
procedure TFrm_Login.Btn_EntrarClick(Sender: TObject);
var
 Usuario : TUsuario;
begin
  if Edt_Login.Text = '' then
    Begin
      Application.MessageBox('Informe o Login Cadastrado!', 'Atenção', Mb_ok+MB_ICONWARNING);
      Edt_Login.SetFocus;
      Abort
    End;
  if Edt_Senha.Text = '' then
    Begin
      Application.MessageBox('Informe o Senha Cadastrado!', 'Atenção', Mb_ok+MB_ICONWARNING);
      Edt_Senha.SetFocus;
      Abort
    End;

  Usuario := TUsuario.Create;
  Try
    Usuario.Login := Trim(Edt_Login.Text);
    Usuario.Senha := Trim(Edt_Senha.Text);

      if Usuario.Logar then
        begin
          ModalResult := mrOk;
        end
      Else
        Begin
          Application.MessageBox('Usuário e/ou Senha Inválidos.', 'Atenção', MB_OK+MB_ICONWARNING);
          Edt_Login.SetFocus;
          Abort;
        End;

  Finally
    FreeAndNil(Usuario);
  End;


end;

//***********************Close Button Action************************************

//------------------------Events------------------------------------------------
procedure TFrm_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOK then
  ModalResult:=mrNo;
end;
//************************Close Events******************************************
end.
