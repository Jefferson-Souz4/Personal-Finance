unit UCad_Contas_Banco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm_Padrao, Data.DB, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFrm_Cad_Banco = class(TFrm_Padrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Banco: TFrm_Cad_Banco;

implementation

{$R *.dfm}

uses ModConexao, UCad_Usuarios, UFuncoes, ULogin, UTela_Inicial, UUsuarios,
  UGetConexao, USQL;

end.
