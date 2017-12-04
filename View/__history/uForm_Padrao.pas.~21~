unit uForm_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrm_Padrao = class(TForm)
    MainMenu1: TMainMenu;
    IrPara1: TMenuItem;
    Sair1: TMenuItem;
    pnl_Barra_Titulo: TPanel;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actNovo: TAction;
    actEditar: TAction;
    actSalvar: TAction;
    actDeletar: TAction;
    actCancelar: TAction;
    actPesquisar: TAction;
    actImprimir: TAction;
    actSair: TAction;
    StatusBar1: TStatusBar;
    pg_Padrao: TPageControl;
    tb_Cadastro: TTabSheet;
    tb_Pesquisa: TTabSheet;
    pnl_Botoes: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Timer1: TTimer;
    DS_TB: TDataSource;
    pnl_Cad_Centro: TPanel;
    pnl_Pes_Centro: TPanel;
    pnl_grid: TPanel;
    dbg_Dados: TDBGrid;
    rdg_Selecionar: TRadioGroup;
    lb_NRegistro: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure rdg_SelecionarClick(Sender: TObject);
    procedure dbg_DadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
 //   Imodo: Integer;
    Procedure LimparTudo;
    procedure ColocarFoco(Sender: TObject);
    procedure SairFoco(Sender: TObject);
    Procedure HabilitaCampos;
    Procedure DesabilitaCampos;
  public
    { Public declarations }
  end;

var
  Frm_Padrao: TFrm_Padrao;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

{ TFrm_Padrao }
//-------------------Procedure--------------------------------------------------
procedure TFrm_Padrao.ColocarFoco(Sender: TObject);
begin
//Procedure Colocar em Foco
   if Sender is TDBEdit then
    TDBEdit(Sender).Color := $00E6FED8
  else if Sender is TEdit then
    TEdit(Sender).Color := $00E6FED8
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := $00E6FED8
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := $00E6FED8
  else if Sender is TDBMemo then
    TDBMemo(Sender).Color := $00E6FED8;
end;



procedure TFrm_Padrao.SairFoco(Sender: TObject);
begin
  //Procedure Sair de Foco
  if Sender is TDBEdit then
    TDBEdit(Sender).Color := clWindow
  else if Sender is TEdit then
    TEdit(Sender).Color := clWindow
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := clWindow
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := clWindow
  else if Sender is TDBMemo then
end;

procedure TFrm_Padrao.HabilitaCampos;

Var I:Integer;

begin
 //Procedure Habilita Campos

    for I := 0 to ComponentCount -1 do
      begin
        if (Components[i] is TEdit) then
       TEdit(Components[i]).Enabled := True;
      end;
end;



procedure TFrm_Padrao.DesabilitaCampos;

Var I:Integer;

begin
//Procedure desabilita Campos

    for I := 0 to ComponentCount -1 do
      begin
        if (Components[i] is TEdit) then
       TEdit (Components[i]).Enabled := False;
      end;
end;



procedure TFrm_Padrao.LimparTudo;

var
  I: Integer;

begin
 for I := 0 to ComponentCount -1 do
  Begin
    if (Components[i] is TEdit) then
       TEdit(Components[i]).Text := '';

  End;
    if pg_Padrao.ActivePage = TB_Cadastro then
     pg_Padrao.ActivePage := TB_Pesquisa;
end;



procedure TFrm_Padrao.rdg_SelecionarClick(Sender: TObject);
begin
  //
end;

procedure TFrm_Padrao.dbg_DadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 // Função
  EditarDBGrid(Ds_TB, dbg_Dados, State, Rect, Column);

end;




//********************Close Procedure*******************************************

//----------------------Event Form----------------------------------------------
procedure TFrm_Padrao.FormCreate(Sender: TObject);
//Settings For Color Focus in Components
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
    begin
      TDBEdit(Components[I]).OnEnter  := ColocarFoco;
      TDBEdit(Components[I]).OnExit   := SairFoco;
    end
    Else
    if Components[I] is TEdit then
    begin
      TEdit(Components[I]).OnEnter  := ColocarFoco;
      TEdit(Components[I]).OnExit   := SairFoco;
    end
    else
    if Components[I] is TDBLookupComboBox then
    begin
      TDBLookupComboBox(Components[I]).OnEnter := ColocarFoco;
      TDBLookupComboBox(Components[I]).OnExit  := SairFoco;
    end
    else
    if Components[I] is TDBComboBox then
    begin
      TDBComboBox(Components[I]).OnEnter := ColocarFoco;
      TDBComboBox(Components[I]).OnExit  := SairFoco;
    end
    else
    if Components[I] is TDBMemo then
    begin
      TDBMemo(Components[I]).OnEnter   := ColocarFoco;
      TDBMemo(Components[I]).OnExit    := SairFoco;
    end
  end;
end;

procedure TFrm_Padrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
//Configuração Evento OnKeyPress - Sair da Tela pelo Botão ESC
  If Key = #27 then
      Close;
 //Após Clicar no Enter o Cursor Avança para o próximo Edit
  if Key = #13 then
    begin
      Key := #0;
      self.Perform(WM_NEXTDLGCTL,0,0);
    end;
end;



//********************Close Events Form****************************************

procedure TFrm_Padrao.Sair1Click(Sender: TObject);
begin
   //Configuração MainMenu Botão -> Sair
  TClientDataSet(DS_TB.DataSet).Cancel;
  TClientDataSet(DS_TB.DataSet).Close;
  Close;
end;


//--------------------StatusBar-------------------------------------------------
procedure TFrm_Padrao.Timer1Timer(Sender: TObject);
begin
   //Configuração StatusBar
  StatusBar1.Panels[2].Text := FormatDateTime('DDDD', Now);
  StatusBar1.Panels[3].Text := DateTimeTostr(Now);
end;
//********************Close StatusBar*******************************************

end.
