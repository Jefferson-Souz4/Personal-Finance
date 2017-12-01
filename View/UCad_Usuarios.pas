unit UCad_Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm_Padrao, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons;

type
  TFrm_Cad_Usuario = class(TFrm_Padrao)
    Edt_Nome: TEdit;
    Edt_SobreNome: TEdit;
    Edt_Login: TEdit;
    Edt_Senha: TEdit;
    lb_Nome: TLabel;
    lb_SobreNome: TLabel;
    lb_Login: TLabel;
    lb_Senha: TLabel;
    procedure ActSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActDeletarExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure Btn_FiltarClick(Sender: TObject);
//    procedure ActNovoExecute(Sender: TObject);
  private
    { Private declarations }
    Procedure ContaRegistro;
    Procedure Buscartudo;

  public
    { Public declarations }
  end;

var
  Frm_Cad_Usuario: TFrm_Cad_Usuario;

implementation

{$R *.dfm}

uses UTela_Inicial, UFuncoes, UCad_Contas_Banco, ModConexao, ULogin,
  UUsuarios, UGetConexao, USQL;
//----------------------Procedure-----------------------------------------------
procedure TFrm_Cad_Usuario.Buscartudo;
begin
//Procedure BuscaTudo os Registros
  DM.CDS_tb_User.Close;
  DM.SQLtb_user.SQL.Clear;
  DM.SQLtb_user.SQL.Add('select * From tb_user');
  DM.CDS_tb_User.Open;
  ContaRegistro;
end;

procedure TFrm_Cad_Usuario.ContaRegistro;
begin
    if DM.CDS_tb_User.RecordCount = 0 then
     begin
       lb_Nun_reg.Visible := True;
       lb_Nun_reg.Caption :='';
       lb_Nun_reg.Caption := 'Nenhum Registro Encontrado';
       Sbtn_Imprimir.Enabled := False;

     end;

     if DM.CDS_tb_User.RecordCount = 1 then
     Begin
       lb_Nun_reg.Visible := True;
       lb_Nun_reg.Caption :='';
       lb_Nun_reg.Caption := IntToStr(DM.CDS_tb_User.RecordCount) +' '+ 'Registro Encontrado ';
       SBtn_Imprimir.Enabled := True;
     End;

     if DM.CDS_tb_User.RecordCount >1 then
     Begin
       lb_Nun_reg.Visible := True;
       lb_Nun_reg.Caption :='';
       lb_Nun_reg.Caption := IntToStr(DM.CDS_tb_User.RecordCount) +' '+ 'Registros Encontrados ';
       Sbtn_Imprimir.Enabled := True;
     End;

end;


//********************Close Procedure*******************************************

procedure TFrm_Cad_Usuario.Btn_FiltarClick(Sender: TObject);
begin
  if Edt_Filtrar.Text = '' then
  Begin
    Try
    if Application.MessageBox('Aten��o, Voc� n�o definiu nenhum valor para pesquisa, dependendo da quantidade de registros pode demorar alguns minutos!!', 'Aten��o', MB_YESNO+MB_ICONQUESTION)= mrYes  then
    DM.CDS_tb_User.Close;
    Dm.CDS_tb_User.CommandText := 'Select * From tb_user';
    DM.CDS_tb_User.Open;
    Edt_filtrar.SetFocus;
    Finally
      Abort
    End;
  End;

  inherited;
  DM.CDS_tb_user.Close;
  case Cb_Selecionar.ItemIndex of
    0:DM.CDS_tb_user.CommandText := 'Select * From tb_user Where Login Like '+QuotedStr('%'+Edt_Filtrar.Text+'%'); //Login
    1:DM.CDS_tb_user.CommandText := 'Select * From tb_user Where Nome Like '+QuotedStr('%'+Edt_Filtrar.Text+'%');//Nome
    2:DM.CDS_tb_user.CommandText := 'Select * From tb_user Where SobreNome Like '+QuotedStr('%'+Edt_Filtrar.Text+'%');//SobreNome
  end;
  DM.CDS_tb_user.Open;
end;


procedure TFrm_Cad_Usuario.FormCreate(Sender: TObject);
begin
  inherited;
  Buscartudo;
end;

procedure TFrm_Cad_Usuario.ActDeletarExecute(Sender: TObject);
begin
  inherited;
  Buscartudo;
end;

procedure TFrm_Cad_Usuario.ActEditarExecute(Sender: TObject);
begin
  inherited;
  //Os dados a serem modificados voltam para a Aba de Cadastro.
  edt_Nome.Text := DM.CDS_tb_UserNome.AsString;
  edt_SobreNome.Text := DM.CDS_tb_UserSobreNome.AsString;
  edt_Login.Text := DM.CDS_tb_UserLogin.AsString;
  edt_Senha.Text := DM.CDS_tb_UserSenha.AsString;
end;

procedure TFrm_Cad_Usuario.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  DM.CDS_tb_User.Close;
  Dm.CDS_tb_User.CommandText := 'Select * From tb_user';
  DM.CDS_tb_User.Open;
  //Buscartudo;
end;

procedure TFrm_Cad_Usuario.ActSalvarExecute(Sender: TObject);
begin
  //Configura��o Bot�o Excute Salvar

 //Configura��o Verifica se o campo Nome est� Vazio.
 if Trim(Edt_Nome.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Nome', 'Aviso', MB_OK+MB_ICONWARNING);
    Edt_Nome.SetFocus;
    Abort;
  End;

  //Configura��o Verifica se o campo SobreNome est� Vazio.
  if Trim(Edt_SobreNome.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo SobreNome', 'Aviso', MB_OK+MB_ICONWARNING);
   Edt_SobreNome.SetFocus;
   Abort;
  End;

  //Fun��o para Verificar se J� existe o Login Cadastrado.
  If (DS_TB.State in [dsInsert]) and (GetVerifCadastroDuplicado(Trim(Edt_Login.Text))) then
  begin
     Application.MessageBox('Login j� Cadastrado, por favor escolha Outro!!', 'Aviso', MB_OK+MB_ICONWARNING);
     Edt_Login.Setfocus;
     Abort;
  end;

  //Configura��o Verifica se o campo Login est� Vazio.
  if Trim(Edt_Login.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Login', 'Aviso', MB_OK+MB_ICONWARNING);
    Edt_Login.SetFocus;
    Abort;
  End;
  //Verifica se campo senha est� vazio.
  if Trim(Edt_Senha.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Senha', 'Aviso', MB_OK+MB_ICONWARNING);
    Edt_Senha.SetFocus;
    Abort;
  End;

  if DS_TB.State in [dsInsert] then

  DM.CDS_tb_UserId.AsInteger := GetId ('ID', 'tb_user' );
  DM.CDS_tb_UserNome.AsString := Trim (Edt_Nome.Text);
  DM.CDS_tb_UserSobreNome.AsString := Trim (Edt_SobreNome.Text);
  DM.CDS_tb_UserLogin.AsString := Trim (Edt_Login.Text);
  DM.CDS_tb_UserSenha.AsString := Trim (Edt_Senha.Text);
  DM.CDS_tb_UserStatus.AsString :='A';
  DM.CDS_tb_UserData_Cadastro.AsDateTime := Now;
  DM.CDS_tb_UserHora_Cadastro.AsDateTime := Now;



  inherited;

end;





end.
