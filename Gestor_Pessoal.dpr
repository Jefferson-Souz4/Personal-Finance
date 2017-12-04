program Gestor_Pessoal;

uses
  Vcl.Forms,
  uTela_Principal in 'View\uTela_Principal.pas' {Frm_Tela_Principal},
  uForm_Padrao in 'View\uForm_Padrao.pas' {Frm_Padrao},
  uDM in 'DM\uDM.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uFuncoes in 'Class\uFuncoes.pas',
  uCadastro_Banco in 'View\uCadastro_Banco.pas' {Frm_Cadastro_Banco},
  uCadastro_Usuario in 'View\uCadastro_Usuario.pas' {Frm_Cadastro_Usuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky 2');
  Application.CreateForm(TFrm_Tela_Principal, Frm_Tela_Principal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
