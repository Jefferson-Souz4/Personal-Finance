unit UUsuarios;

interface

 Type
  TUsuario = Class

  Private

  Flogin : String;
  FSenha : String;

  Public

  property Login: String read FLogin write Flogin;
  property Senha: String read FSenha write FSenha;
  Function Logar: Boolean;

  end;

 implementation

uses
  USQL, Data.SqlExpr;

   Function TUsuario.Logar: Boolean;
   Begin
     With TSqlQuery.Create(Nil) do
     Try

       SQL.Add('Select ID From tb_user Where Login = :Login And Senha = :Senha');
       Params[0].AsString := FLogin;
       Params[1].AsString := FSenha;
       Open;
       Result := Fields[0].AsInteger > 0;
     Finally
       Close;
       Free;
     End;
   End;



end.
