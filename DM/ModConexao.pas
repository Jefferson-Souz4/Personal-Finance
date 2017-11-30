unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    CDS_tb_User: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1Id: TIntegerField;
    SQLDataSet1Nome: TStringField;
    SQLDataSet1SobreNome: TStringField;
    SQLDataSet1Login: TStringField;
    SQLDataSet1Senha: TStringField;
    SQLDataSet1Status: TStringField;
    SQLDataSet1Data_Cadastro: TDateField;
    SQLDataSet1Hora_Cadastro: TTimeField;
    CDS_tb_UserId: TIntegerField;
    CDS_tb_UserNome: TStringField;
    CDS_tb_UserSobreNome: TStringField;
    CDS_tb_UserLogin: TStringField;
    CDS_tb_UserSenha: TStringField;
    CDS_tb_UserStatus: TStringField;
    CDS_tb_UserData_Cadastro: TDateField;
    CDS_tb_UserHora_Cadastro: TTimeField;
    FdConctn: TFDConnection;
    DStb_user: TDataSource;
    SQLtb_user: TFDQuery;
    Fdtb_user: TFDTable;
    Driver: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UForm_Padao, UTela_Inicial, UCad_Usuarios;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin

  FdConctn.Params.Database := 'gerenciador_financeiro';
  FdConctn.Params.UserName := 'root';
  FdConctn.Params.Password := '123';

  FdConctn.Connected       := True;

  Driver.VendorLib := GetCurrentDir +'\lib\libmySQL.dll';

  Fdtb_user.TableName := 'tb_user';
  Fdtb_user.Active    := True
end;

end.
