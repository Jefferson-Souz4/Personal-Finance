unit UGetConexao;

interface

uses
  Data.SqlExpr;

type TGetConexao = class

public
Class function Conexao : TSQLConnection;

End;

implementation
 uses  ModConexao;


{ TGetConexao }


class function TGetConexao.Conexao: TSQLConnection;

begin

result := DM.SQLConnection1;

end;


end.
