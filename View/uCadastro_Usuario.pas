unit uCadastro_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm_Padrao, Data.DB, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrm_Cadastro_Usuario = class(TFrm_Padrao)
    dbe_Nome: TDBEdit;
    dbe_sobreNome: TDBEdit;
    dbe_Data_Nascimento: TDBEdit;
    dbe_Login: TDBEdit;
    dbe_Senha: TDBEdit;
    lb_Nome: TLabel;
    lb_SobreNome: TLabel;
    lb_Data_Nascimento: TLabel;
    lb_Login: TLabel;
    lb_Senha: TLabel;
    procedure actSalvarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure sbtn_FiltrarClick(Sender: TObject);
    procedure rdg_SelecionarClick(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);

  private
    { Private declarations }
    Procedure ContaRegistro;
    Procedure Buscartudo;


  public
    { Public declarations }
  end;

var
  Frm_Cadastro_Usuario: TFrm_Cadastro_Usuario;

implementation

{$R *.dfm}

uses uDM, uFuncoes;



{ TFrm_Cadastro_Usuario }
//----------------------Procedure-----------------------------------------------


procedure TFrm_Cadastro_Usuario.ContaRegistro;
begin
 if DM.FT_tbUsuario.RecordCount = 0 then
     begin
       lb_Nregistro.Visible := True;
       lb_Nregistro.Caption :='';
       lb_Nregistro.Caption := 'Nenhum Registro Encontrado';
       Sbtn_Imprimir.Enabled := False;

     end;

     if DM.FT_tbUsuario.RecordCount = 1 then
     Begin
       lb_Nregistro.Visible := True;
       lb_Nregistro.Caption :='';
       lb_Nregistro.Caption := IntToStr(DM.FT_tbUsuario.RecordCount) +' '+ 'Registro Encontrado ';
       SBtn_Imprimir.Enabled := True;
     End;

     if DM.FT_tbUsuario.RecordCount >1 then
     Begin
       lb_Nregistro.Visible := True;
       lb_Nregistro.Caption :='';
       lb_Nregistro.Caption := IntToStr(DM.FT_tbUsuario.RecordCount) +' '+ 'Registros Encontrados ';
       Sbtn_Imprimir.Enabled := True;
     End;

end;



procedure TFrm_Cadastro_Usuario.Buscartudo;
begin
//Procedure BuscaTudo os Registros
  DM.FQ_tbUsuario.Close;
  DM.FQ_tbUsuario.SQL.Clear;
  DM.FQ_tbUsuario.SQL.Add('select * From tb_usuario');
  DM.FQ_tbUsuario.Open;
end;

//********************Close Procedure*******************************************

//----------------------Events Button-------------------------------------------
procedure TFrm_Cadastro_Usuario.actDeletarExecute(Sender: TObject);
begin
  inherited;
  Buscartudo;
  ContaRegistro;
end;



procedure TFrm_Cadastro_Usuario.actEditarExecute(Sender: TObject);
begin
  inherited;
  //Os dados a serem modificados voltam para a Aba de Cadastro.
  //////////////Esta com err/////
  dbe_Nome.Text := DM.FT_tbUsuarioNome.AsString;
  dbe_SobreNome.Text := DM.FT_tbUsuarioSobreNome.AsString;
  dbe_Data_Nascimento.Text := DM.FT_tbUsuarioData_Nascimento.AsString;
  dbe_Login.Text := DM.FT_tbUsuarioLogin.AsString;
  dbe_Senha.Text := DM.FT_tbUsuarioSenha.AsString;
end;

procedure TFrm_Cadastro_Usuario.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  Buscartudo;
  ContaRegistro;
end;

procedure TFrm_Cadastro_Usuario.actSalvarExecute(Sender: TObject);
begin
  //Configuração Botão Excute Salvar
  BuscarTudo;
 //Configuração Verifica se o campo Nome está Vazio.
 if Trim(dbe_Nome.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Nome', 'Aviso', MB_OK+MB_ICONWARNING);
    dbe_Nome.SetFocus;
    Abort;
  End;

  //Configuração Verifica se o campo SobreNome está Vazio.
  if Trim(dbe_SobreNome.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo SobreNome', 'Aviso', MB_OK+MB_ICONWARNING);
   dbe_SobreNome.SetFocus;
   Abort;
  End;

  //Configuração Verifica se o campo SobreNome está Vazio.
  if Trim(dbe_Data_Nascimento.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Data de Nascimento', 'Aviso', MB_OK+MB_ICONWARNING);
   dbe_Data_Nascimento.SetFocus;
   Abort;
  End;

  //Função para Verificar se Já existe o Login Cadastrado.
  If (DS_TB.State in [dsInsert]) and (GetVerifCadastroDuplicado(Trim(dbe_Login.Text))) then
  begin
     Application.MessageBox('Login já Cadastrado, por favor escolha Outro!!', 'Aviso', MB_OK+MB_ICONWARNING);
     dbe_Login.Setfocus;
     Abort;
  end;

  //Configuração Verifica se o campo Login está Vazio.
  if Trim(dbe_Login.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Login', 'Aviso', MB_OK+MB_ICONWARNING);
    dbe_Login.SetFocus;
    Abort;
  End;
  //Verifica se campo senha está vazio.
  if Trim(dbe_Senha.Text) = '' then
  Begin
    Application.MessageBox('Preencha o Campo Senha', 'Aviso', MB_OK+MB_ICONWARNING);
    dbe_Senha.SetFocus;
    Abort;
  End;

  if DS_TB.State in [dsInsert] then

  DM.FT_tbUsuarioStatus.AsString :='A';
  DM.FT_tbUsuarioData_Cadastro.AsDateTime := Now;
  DM.FT_tbUsuarioHora_Cadastro.AsDateTime := Now;



  inherited;
end;

procedure TFrm_Cadastro_Usuario.sbtn_FiltrarClick(Sender: TObject);

begin
  //Configuração Botão Filtrar
  With DM.FQ_tbUsuario do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From tb_usuario');

    case rdg_Selecionar.ItemIndex of
      0:
      begin
      SQL.Add('Where Nome Like :vNome');
      ParamByName('vNome').value:= '%'+ edt_Filtrar.Text + '%';
      end;
      1: //SobreNome
        begin
          SQL.Add('where SobreNome Like :vSobreNome');
          ParamByName('vSobreNome').Value := '%'+ edt_Filtrar.Text + '%';
        end;
        2: //Login
          Begin
            SQL.Add('where Login Like :vLogin');
            ParamByName('vLogin').Value := '%'+ edt_Filtrar.Text + '%';
          End;
    end;
    DM.FQ_tbUsuario.Open;
    ContaRegistro;

    inherited;
  end;

end;



//********************Close Events Button***************************************


//-------------------Config RadioGroup------------------------------------------
procedure TFrm_Cadastro_Usuario.rdg_SelecionarClick(Sender: TObject);
begin
  inherited;
//Configuração das opções do Radio Group Selecionar
    case rdg_Selecionar.ItemIndex of
      0: //Nome
      begin
        edt_Filtrar.Visible:= True;
        lb_Pesquisar.Caption :='Digite o Nome ';
        lb_Pesquisar.Visible := True;
        edt_Filtrar.Clear;
        Sbtn_Filtrar.Enabled := True;
        edt_Filtrar.SetFocus;

      end;
      1: //SobreNome
      Begin
        edt_Filtrar.Visible:= True;
        lb_Pesquisar.Caption :='Digite o SobreNome';
        lb_Pesquisar.Visible := True;
        edt_Filtrar.Clear;
        sbtn_Filtrar.Enabled := True;
        edt_Filtrar.SetFocus;
      End;
      2: //Login
      begin
        edt_Filtrar.Visible:= True;
        lb_Pesquisar.Caption :='Digite o Login';
        lb_Pesquisar.Visible := True;
        edt_Filtrar.Clear;
        sbtn_Filtrar.Enabled := True;
        edt_Filtrar.SetFocus;
      end;
    end;
end;
//********************Close RadioGroup******************************************

 procedure TFrm_Cadastro_Usuario.FormCreate(Sender: TObject);
begin
  inherited;
  Buscartudo;
  contaregistro;

end;

end.
