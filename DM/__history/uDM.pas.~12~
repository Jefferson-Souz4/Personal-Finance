unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, FireDAC.UI.Intf,
  FireDAC.VCLUI.Error, FireDAC.Stan.Error, FireDAC.VCLUI.Login,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Intf, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Option, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection: TFDConnection;
    DS_tbUsuario: TDataSource;
    FQ_tbUsuario: TFDQuery;
    FT_tbUsuario: TFDTable;
    Driver: TFDPhysMySQLDriverLink;
    FQ_tbUsuarioId: TFDAutoIncField;
    FQ_tbUsuarioNome: TStringField;
    FQ_tbUsuarioSobreNome: TStringField;
    FQ_tbUsuarioLogin: TStringField;
    FQ_tbUsuarioData_Cadastro: TDateField;
    FQ_tbUsuarioHora_Cadastro: TTimeField;
    FQ_tbUsuarioData_Nascimento: TDateField;
    FQ_tbUsuarioUsuario: TStringField;
    FQ_tbUsuarioStatus: TStringField;
    FQ_tbUsuarioSenha: TStringField;
    FT_tbUsuarioId: TFDAutoIncField;
    FT_tbUsuarioNome: TStringField;
    FT_tbUsuarioSobreNome: TStringField;
    FT_tbUsuarioLogin: TStringField;
    FT_tbUsuarioData_Cadastro: TDateField;
    FT_tbUsuarioHora_Cadastro: TTimeField;
    FT_tbUsuarioData_Nascimento: TDateField;
    FT_tbUsuarioUsuario: TStringField;
    FT_tbUsuarioStatus: TStringField;
    FT_tbUsuarioSenha: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
