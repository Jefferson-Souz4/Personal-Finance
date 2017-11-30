program Gestor_Pessoal;

uses
  Vcl.Forms,
  UTela_Inicial in 'View\UTela_Inicial.pas' {Frm_Tela_Inicial},
  UForm_Padao in 'View\UForm_Padao.pas' {Frm_Padrao},
  ModConexao in 'DM\ModConexao.pas' {DM: TDataModule},
  UCad_Usuarios in 'View\UCad_Usuarios.pas' {Frm_Cad_Usuario},
  UFuncoes in 'Classes\UFuncoes.pas',
  UCad_Contas_Banco in 'View\UCad_Contas_Banco.pas' {Frm_Cad_Banco},
  ULogin in 'View\ULogin.pas' {Frm_Login},
  UUsuarios in 'Classes\UUsuarios.pas',
  UGetConexao in 'Classes\UGetConexao.pas',
  USQL in 'Classes\USQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Tela_Inicial, Frm_Tela_Inicial);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
