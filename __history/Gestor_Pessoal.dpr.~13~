program Gestor_Pessoal;

uses
  Vcl.Forms,
  uTela_Principal in 'View\uTela_Principal.pas' {Frm_Tela_Principal},
  uForm_Padrao in 'View\uForm_Padrao.pas' {Frm_Padrao},
  uDM in 'DM\uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Tela_Principal, Frm_Tela_Principal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
