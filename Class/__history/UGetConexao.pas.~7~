unit UGetConexao;

interface

uses
  Data.SqlExpr;

type TGetConexao = class

public
Class function Conexao : TSQLConnection;

End;

implementation
 uses  ModConexao, UCad_Contas_Banco, UCad_Usuarios, UForm_Padrao, UFuncoes,
  ULogin, USQL, UTela_Inicial, UUsuarios;


{ TGetConexao }


class function TGetConexao.Conexao: TSQLConnection;

begin

result := DM.SQLConnection;

end;


end.
