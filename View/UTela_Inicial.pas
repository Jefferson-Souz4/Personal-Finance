unit UTela_Inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.Series;

type
  TFrm_Tela_Inicial = class(TForm)
    Btn_Frm_Padrao: TButton;
    MainMenu1: TMainMenu;
    Pnl_Barra_Titulo: TPanel;
    Cadastro1: TMenuItem;
    Relatrio1: TMenuItem;
    Manuteno1: TMenuItem;
    Ajuda1: TMenuItem;
    Sair1: TMenuItem;
    ContasBancrias1: TMenuItem;
    CartodeCrdito1: TMenuItem;
    Usurios1: TMenuItem;
    Ferramentas1: TMenuItem;
    Calculadora1: TMenuItem;
    Pnl_Botoes: TPanel;
    Pnl_Graficos: TPanel;
    StatusBar1: TStatusBar;
    Btn_Cad_User: TButton;
    Timer1: TTimer;
    Sbtn_Receita: TSpeedButton;
    Sbtn_Pagamento: TSpeedButton;
    Sbtn_Investimento: TSpeedButton;
    Sbtn_Relatorio: TSpeedButton;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    Series1: TBarSeries;
    Series2: TPieSeries;
    FormulrioPadro1: TMenuItem;
    ipodeDespesa1: TMenuItem;
    btn_Cad_Banco: TButton;
    btn_login: TButton;
    procedure Btn_Frm_PadraoClick(Sender: TObject);
    procedure Btn_Cad_UserClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Usurios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_Cad_BancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Tela_Inicial: TFrm_Tela_Inicial;

implementation

{$R *.dfm}

uses UForm_Padao, UCad_Usuarios, UCad_Contas_Banco, UFuncoes, ULogin,
  ModConexao, UUsuarios;

//----------------------Main Menu-----------------------------------------------
procedure TFrm_Tela_Inicial.Usurios1Click(Sender: TObject);
begin
//Configura��o Bot�o MainMenu Cadastro-> Usu�rio
  Frm_Cad_Usuario:= TFrm_Cad_Usuario.Create(nil);
    Try
      Frm_Cad_Usuario.ShowModal
    Finally
      FreeAndNil(Frm_Cad_Usuario);

    end;


end;

procedure TFrm_Tela_Inicial.Sair1Click(Sender: TObject);
begin
  //Configura��o Bot�o MainMenu -> SAIR
  if Application.MessageBox('Deseja Sair do Sistema?', 'Informa��o', MB_YESNO+MB_ICONQUESTION) = mrYes then

  Application.Terminate
  Else
    Abort;


end;

//********************Close Main Menu*******************************************



//-------------------------Events-----------------------------------------------
procedure TFrm_Tela_Inicial.FormCreate(Sender: TObject);
begin
Frm_Login:= TFrm_Login.Create(nil);
    Try
      Frm_login.ShowModal
    Finally
      FreeAndNil(Frm_login);
    end;
end;



procedure TFrm_Tela_Inicial.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  //Event configuration  onclose
  if Application.MessageBox('Deseja Sair do Sistema?', 'Informa��o', MB_YESNO+MB_ICONQUESTION) = mrYes then

  Application.Terminate
  Else
    Abort;
end;


procedure TFrm_Tela_Inicial.FormKeyPress(Sender: TObject; var Key: Char);
begin
 //Event Configuration OnKeyPress - Sair da Tela pelo Bot�o ESC
  if Key = #27 then
  Close;
end;

//********************Close Events Form*****************************************



//---------------------A��o Execute Bot�es--------------------------------------
procedure TFrm_Tela_Inicial.Btn_Frm_PadraoClick(Sender: TObject);
begin
  //Bot�o Abre Form Padr�o
  Frm_padrao:= TFrm_padrao.Create(nil);
    Try
      Frm_Padrao.ShowModal
    Finally
      FreeAndNil(Frm_Padrao);
    end;
end;

procedure TFrm_Tela_Inicial.btn_loginClick(Sender: TObject);
begin
  //Bot�o Abre Form Login
  Frm_Login:= TFrm_Login.Create(nil);
    Try
      Frm_login.ShowModal
    Finally
      FreeAndNil(Frm_login);
    end;
end;

procedure TFrm_Tela_Inicial.btn_Cad_BancoClick(Sender: TObject);
begin
//Bot�o Abre Form Cadastro Bancos
  Frm_Cad_Banco:= TFrm_Cad_banco.Create(nil);
    Try
      Frm_Cad_Banco.ShowModal
    Finally
      FreeAndNil(Frm_Cad_Banco);
    end;
end;

procedure TFrm_Tela_Inicial.Btn_Cad_UserClick(Sender: TObject);
begin
  //Bot�o Abre Form Cadastro Usu�rios
 Frm_Cad_Usuario:= TFrm_Cad_Usuario.Create(nil);
    Try
      Frm_Cad_Usuario.ShowModal
    Finally
      FreeAndNil(Frm_Cad_Usuario);
    end;
end;

//********************Fecha A��o Execute Bot�es*********************************


//--------------------StatusBar-------------------------------------------------
procedure TFrm_Tela_Inicial.Timer1Timer(Sender: TObject);
begin
//Configura��o StatusBar
  StatusBar1.Panels[2].Text := FormatDateTime('DDDD', Now);
  StatusBar1.Panels[3].Text := DateTimeTostr(Now);
end;


//********************Fecha StatusBar*******************************************

end.
