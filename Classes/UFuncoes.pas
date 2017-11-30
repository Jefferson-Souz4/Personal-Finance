unit UFuncoes;

interface
  Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Menus, Vcl.ToolWin, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, Data.DBXMySQL, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider;

  Function GetId (Campos, Tabela : String) : Integer;
  Function GetVerifCadastroDuplicado (Login : String):Boolean;
  Procedure EditarDBGrid (DataSource: TDataSource; Sender: TDBGrid; State : TGridDrawState; Rect : TRect; Column : TColumn);

implementation

uses UCad_Usuarios, UForm_Padao, UTela_Inicial, ModConexao;
  //Função para auto incrementar o ID no Banco.
  Function GetId (Campos, Tabela : String) : Integer;
  Begin
    With
    TSQLQuery.Create(nil) do
    Try
      SQLconnection:= DM.SQLConnection1;
      SQL.Add('Select '+Campos+' From '+Tabela+' ORder By '+Campos+' Desc Limit 1');
      Open;
      Result := Fields[0].AsInteger + 1;
    Finally
     Close;
     Free;
    End;

  End;

  //Função para Verificar se Já existe o Login Cadastrado.
  Function GetVerifCadastroDuplicado (Login : String):Boolean;
  begin
  Result := False;
    With
    TSQLQuery.Create(nil) do
      Try
        SQLConnection :=DM.SQLConnection1;
        SQL.ADD('Select Id From tb_user Where Login = :Login');
        Params [0].AsString := Login;
        Open;
        if not IsEmpty then
            Result :=True;
      Finally
      Close;
      Free;
      End;

  end;

  Procedure EditarDBGrid (DataSource: TDataSource; Sender: TDBGrid; State : TGridDrawState; Rect : TRect; Column : TColumn);
  Begin
    if not odd(DataSource.Dataset.RecNo) then
    Begin
      if Not (GdSelected in State) then
       Begin
        Sender.Canvas.Brush.Color := $00FFEFDF ;
        Sender.Canvas.FillRect(Rect);
        Sender.DefaultDrawDataCell(Rect, Column.Field, State);

       End;
    End;

  End;



end.
