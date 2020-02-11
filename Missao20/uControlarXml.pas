unit uControlarXml;

interface

uses
  xmlMissao20, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TControlarXml = class
  private
    FXMLResponseType: IXMLResponseType;
    FValorSendoAlterado: Boolean;
    FControlarBotoes: Integer;
    FIndice: Integer;
    FId: TEdit;
    FNome: TEdit;
    FSobrenome: TEdit;
    FGenero: TComboBox;
    FDataNascimento: TDateTimePicker;
    FEmail: TEdit;
    FWebsite: TEdit;
    FTelefone: TEdit;
    FEndereco: TEdit;
    FStatus: TComboBox;
    FBtnPrimeiro: TSpeedButton;
    FBtnAnterior: TSpeedButton;
    FBtnProximo: TSpeedButton;
    FBtnUltimo: TSpeedButton;
    FBtnCarregarXml: TSpeedButton;
    FBtnAdicionar: TSpeedButton;
    FBtnSalvar: TSPeedButton;
    FBtnRemover: TSpeedButton;
  public
    constructor Create(pId, pNome, pSobrenome: TEdit; pGenero: TComboBox;
      pDataNascimento: TDateTimePicker; pEmail, pTelefone, pWebsite,
      pEndereco: TEdit; pStatus: TComboBox; pBtnPrimeiro, pBtnAnterior,
      pBtnProximo, pBtnUltimo, pBtnCarregarXml, pBtnAdicionar, pBtnSalvar,
      pBtnRemover: TSpeedButton);
    procedure Primeiro;
    procedure Anterior;
    procedure Proximo;
    procedure Ultimo;
    procedure CarregarXml;
    procedure Adicionar;
    procedure Remover;
    procedure Salvar;
    procedure SalvarArquivoXml;
    procedure CarregarCampos;
    procedure HabilitarCampos;
    procedure ControlarBotoes;
    procedure LimparCampos;
    procedure ValidarDados;
    function NovoId: String;
    function GeneroStrToInteger(pGenero: String): Integer;
    function StatusStrToInteger(pStatus: String): Integer;
  end;

implementation

uses
  System.Math, System.SysUtils, Xml.XMLIntf, Xml.XMLDoc, Vcl.Dialogs, Vcl.Graphics;

{ TControlarXml }

constructor TControlarXml.Create(pId, pNome, pSobrenome: TEdit; pGenero: TComboBox;
      pDataNascimento: TDateTimePicker; pEmail, pTelefone, pWebsite,
      pEndereco: TEdit; pStatus: TComboBox; pBtnPrimeiro, pBtnAnterior,
      pBtnProximo, pBtnUltimo, pBtnCarregarXml, pBtnAdicionar, pBtnSalvar,
      pBtnRemover: TSpeedButton);
begin
  FIndice := ZeroValue;
  FId := pId;
  FNome := pNome;
  FSobrenome := pSobrenome;
  FGenero := pGenero;
  FDataNascimento := pDataNascimento;
  FEmail := pEmail;
  FTelefone := pTelefone;
  FWebsite := pWebsite;
  FEndereco := pEndereco;
  FStatus := pStatus;
  FBtnPrimeiro := pBtnPrimeiro;
  FBtnAnterior := pBtnAnterior;
  FBtnProximo := pBtnProximo;
  FBtnUltimo := pBtnUltimo;
  FBtnCarregarXml := pBtnCarregarXml;
  FBtnAdicionar := pBtnAdicionar;
  FBtnSalvar := pBtnSalvar;
  FBtnRemover := pBtnRemover;
end;

procedure TControlarXml.CarregarCampos;
var
  oXMLItemType: IXMLItemType;
begin
  oXMLItemType := FXMLResponseType.Result.Item[FIndice];

  FId.Text := oXMLItemType.Id.ToString;
  FNome.Text := oXMLItemType.First_name;
  FSobrenome.Text := oXMLItemType.Last_name;
  FGenero.ItemIndex := GeneroStrToInteger(oXMLItemType.Gender);
  FDataNascimento.Date := StrToDateDef(oXMLItemType.Dob, ZeroValue);
  FEmail.Text := oXMLItemType.Email;
  FTelefone.Text := oXMLItemType.Phone;
  FWebsite.Text := oXMLItemType.Website;
  FEndereco.Text := oXMLItemType.Address;
  FStatus.ItemIndex := StatusStrToInteger(oXMLItemType.Status);

  ControlarBotoes;
end;

procedure TControlarXml.ControlarBotoes;
begin
  FBtnPrimeiro.Enabled := (FXMLResponseType.Result.Count > 0) and
                          (FIndice <> 0);

  FBtnAnterior.Enabled := FBtnPrimeiro.Enabled = True;;

  FBtnProximo.Enabled := (FXMLResponseType.Result.Count > 0) and
                         (FIndice <> Pred(FXMLResponseType.Result.Count));

  FBtnUltimo.Enabled := FBtnProximo.Enabled = True;

  FBtnCarregarXml.Enabled := FXMLResponseType.Result.Count = 0;

  FBtnAdicionar.Enabled := (FXMLResponseType.Result.Count > 0) and
                           ((FControlarBotoes = 0) or (FControlarBotoes = 2));

  FBtnSalvar.Enabled := (FXMLResponseType.Result.Count > 0);

  FBtnRemover.Enabled := (FXMLResponseType.Result.Count > 0) and
                         (FBtnAdicionar.Enabled = True);
end;

procedure TControlarXml.Primeiro;
begin
  FIndice := ZeroValue;
  FControlarBotoes := 0;
  CarregarCampos;
end;

procedure TControlarXml.Anterior;
begin
  FIndice := Pred(FIndice);

  if FControlarBotoes = 1 then
    FIndice := Pred(FXMLResponseType.Result.Count);

  FControlarBotoes := 0;
  CarregarCampos;
end;

procedure TControlarXml.Proximo;
begin
  FIndice := Succ(FIndice);
  FControlarBotoes := 0;
  CarregarCampos;
end;

procedure TControlarXml.Ultimo;
begin
  FIndice := Pred(FXMLResponseType.Result.Count);
  FControlarBotoes := 0;
  CarregarCampos;
end;

procedure TControlarXml.ValidarDados;
var
  nId: Integer;
  nIndex: Integer;
  oXMLItemType: IXMLItemType;
begin
  if Trim(FId.Text) = EmptyStr then
  begin
    FId.SetFocus;
    raise Exception.Create('Campo ''Id'' inválido!');
  end;

  FValorSendoAlterado := False;
  nId := StrToIntDef(FId.Text, 0);
  for nIndex := 0 to Pred(FXMLResponseType.Result.Count) do
  begin
    oXMLItemType := FXMLResponseType.Result.Item[nIndex];
    if nId = oXMLItemType.Id then
    begin
      if (FBtnAdicionar.Enabled = True) then
        FValorSendoAlterado := True
      else
        raise Exception.Create('Campo ''id'' duplicado!');

      Break;
    end;
  end;

  if Trim(FNome.Text) = EmptyStr then
  begin
    FNome.SetFocus;
    raise Exception.Create('Campo ''Nome'' inválido!');
  end;

  if Trim(FSobrenome.Text) = EmptyStr then
  begin
    FSobrenome.SetFocus;
    raise Exception.Create('Campo ''Sobrenome'' inválido!');
  end;

  if Trim(FGenero.Text) = EmptyStr then
  begin
    FGenero.SetFocus;
    raise Exception.Create('Campo ''Gênero'' inválido!');
  end;

  if Trim(FStatus.Text) = EmptyStr then
  begin
    FStatus.SetFocus;
    raise Exception.Create('Campo ''Status'' inválido!');
  end;
end;

procedure TControlarXml.CarregarXml;
var
  oXmlItemType: IXMLItemType;
begin
  FXMLResponseType := xmlMissao20.LoadResponse('../../xmlMissao20.xml');
  oXMLItemType := FXMLResponseType.Result.Item[ZeroValue];
  HabilitarCampos;
  CarregarCampos;
  FControlarBotoes := 0;
end;

procedure TControlarXml.HabilitarCampos;
begin
  FId.Enabled := True;
  FNome.Enabled := True;
  FSobrenome.Enabled := True;
  FGenero.Enabled := True;
  FDataNascimento.Enabled := True;
  FWebsite.Enabled := True;
  FEndereco.Enabled := True;
  FEmail.Enabled := True;
  FTelefone.Enabled := True;
  FStatus.Enabled := True;
end;

procedure TControlarXml.Adicionar;
begin
  LimparCampos;
  FId.Text := NovoId;
  FNome.SetFocus;
  FIndice := Pred(FXMLResponseType.Result.Count);
  FControlarBotoes := 1;
  ControlarBotoes;
end;

function TControlarXml.NovoId: String;
var
  nUltimoItem: Integer;
  nNovoId: Integer;
  oXmlItemType: IXMLITemType;
begin
  nUltimoItem := Pred(FXMLResponseType.Result.Count);
  oXmlItemType := FXMLResponseType.Result.Item[nUltimoItem];
  nNovoId := Succ(oXmlItemType.Id);
  Result := IntToStr(nNovoId);
end;

procedure TControlarXml.Salvar;
var
  oXMLItemType: IXMLItemType;
begin
  ValidarDados;

  if FValorSendoAlterado then
  begin
    oXMLItemType := FXMLResponseType.Result.Item[FIndice]
  end
  else
  begin
    oXMLItemType := FXMLResponseType.Result.Add;
    FIndice := Succ(FIndice);
  end;

  oXMLITemType.Id := StrToInt(FId.Text);
  oXMLItemType.First_name := FNome.Text;
  oXMLItemType.Last_name := FSobrenome.Text;
  oXMLItemType.Gender := FGenero.Text;
  oXMLItemType.Dob := FormatDateTime('aaaa-mm-dd',FDataNascimento.Date);
  oXMLItemType.Email := FEmail.Text;
  oXMLItemType.Phone := FTelefone.Text;
  oXMLItemType.Website := FWebsite.Text;
  oXMLItemType.Address := FEndereco.Text;
  oXMLItemType.Status := FStatus.Text;

  SalvarArquivoXml;
  ShowMessage('Registro Salvo!');
  FControlarBotoes := 2;
  ControlarBotoes;
end;

procedure TControlarXml.SalvarArquivoXml;
var
  oXMLDocument: IXMLDocument;
begin
  oXMLDocument := TXMLDocument.Create(nil);
  oXMLDocument.LoadFromXML(FXMLResponseType.XML);
  oXMLDocument.SaveToFile('../../xmlMissao20.xml');
end;

procedure TControlarXml.Remover;
begin
  FXMLResponseType.Result.Delete(FIndice);
  SalvarArquivoXml;
  ShowMessage('Registro Removido!');
  FIndice := Pred(FIndice);

  if FIndice < ZeroValue then
    FIndice := 0;

  CarregarCampos;
end;

procedure TControlarXml.LimparCampos;
begin
  FId.Clear;
  FNome.Clear;
  FSobrenome.Clear;
  FGenero.ItemIndex := -1;
  FDataNascimento.Date := Date;
  FEmail.Clear;
  FWebsite.Clear;
  FTelefone.Clear;
  FEndereco.Clear;
  FStatus.ItemIndex := -1;
end;

function TControlarXml.StatusStrToInteger(pStatus: String): Integer;
begin
  if pStatus = 'Ativo' then
    Result := 0
  else
    Result := 1;
end;

function TControlarXml.GeneroStrToInteger(pGenero: String): Integer;
begin
  if pGenero = 'Masculino' then
    Result := 0
  else
    Result := 1;
end;

end.
