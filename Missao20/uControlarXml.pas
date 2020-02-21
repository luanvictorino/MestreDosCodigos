unit uControlarXml;

interface

uses
  xmlMissao20, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Xml.XMLIntf;

type
  TControlarXml = class
  private
    FXMLResponseType: IXMLResponseType;
    FXMLItemType: IXMLItemType;
    FXMLDocument: IXMLDocument;
    FValorSendoAlterado: Boolean;
    FIndice: Integer;
    FAdicionandoRegistro: Boolean;
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
  System.Math, System.SysUtils, Vcl.Dialogs, Vcl.Graphics, Xml.XMLDoc;

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
  FXMLDocument := TXMLDocument.Create(nil);
end;

procedure TControlarXml.CarregarCampos;
begin
  FXMLItemType := FXMLResponseType.Result.Item[FIndice];

  FId.Text := FXMLItemType.Id.ToString;
  FNome.Text := FXMLItemType.First_name;
  FSobrenome.Text := FXMLItemType.Last_name;
  FGenero.ItemIndex := GeneroStrToInteger(FXMLItemType.Gender);
  FDataNascimento.Date := StrToDateDef(FXMLItemType.Dob, ZeroValue);
  FEmail.Text := FXMLItemType.Email;
  FTelefone.Text := FXMLItemType.Phone;
  FWebsite.Text := FXMLItemType.Website;
  FEndereco.Text := FXMLItemType.Address;
  FStatus.ItemIndex := StatusStrToInteger(FXMLItemType.Status);
  FXMLDocument.LoadFromXML(FXMLResponseType.XML);
end;

procedure TControlarXml.ControlarBotoes;
var
  nQtdRegistrosXml: Integer;
begin
  nQtdRegistrosXml := FXMLResponseType.Result.Count;

  FBtnPrimeiro.Enabled := (nQtdRegistrosXml > ZeroValue) and
                          (FIndice <> ZeroValue);

  FBtnAnterior.Enabled := FBtnPrimeiro.Enabled;

  FBtnProximo.Enabled := (nQtdRegistrosXml > ZeroValue) and
                         (FIndice <> Pred(nQtdRegistrosXml));

  FBtnUltimo.Enabled := FBtnProximo.Enabled;

  FBtnCarregarXml.Enabled := nQtdRegistrosXml = ZeroValue;

  FBtnAdicionar.Enabled := (nQtdRegistrosXml > ZeroValue) and
                            not(FAdicionandoRegistro);

  FBtnSalvar.Enabled := (nQtdRegistrosXml > ZeroValue);

  FBtnRemover.Enabled := (nQtdRegistrosXml > ZeroValue) and
                         (FBtnAdicionar.Enabled);
end;

procedure TControlarXml.Primeiro;
begin
  FIndice := ZeroValue;
  CarregarCampos;
  ControlarBotoes;
end;

procedure TControlarXml.Anterior;
begin
  FIndice := Pred(FIndice);
  if FAdicionandoRegistro then
  begin
    FIndice := Pred(FXMLResponseType.Result.Count);
    FAdicionandoRegistro := False;
  end;

  CarregarCampos;
  ControlarBotoes;
end;

procedure TControlarXml.Proximo;
begin
  FIndice := Succ(FIndice);
  CarregarCampos;
  ControlarBotoes;
end;

procedure TControlarXml.Ultimo;
begin
  FIndice := Pred(FXMLResponseType.Result.Count);
  CarregarCampos;
  ControlarBotoes;
end;

procedure TControlarXml.ValidarDados;
var
  nId: Integer;
  nIndex: Integer;
begin
  if string(FId.Text).Trim.IsEmpty then
  begin
    FId.SetFocus;
    raise Exception.Create('Campo ''Id'' inválido!');
  end;

  FValorSendoAlterado := False;
  nId := StrToIntDef(FId.Text, 0);
  for nIndex := 0 to Pred(FXMLResponseType.Result.Count) do
  begin
    FXMLItemType := FXMLResponseType.Result.Item[nIndex];
    if nId = FXMLItemType.Id then
    begin
      if (FBtnAdicionar.Enabled) then
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
begin
  FXMLResponseType := xmlMissao20.LoadResponse('../../xmlMissao20.xml');
  FXMLItemType := FXMLResponseType.Result.Item[ZeroValue];
  HabilitarCampos;
  CarregarCampos;
  ControlarBotoes;
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
  FAdicionandoRegistro := True;
  ControlarBotoes;
end;

function TControlarXml.NovoId: String;
var
  nUltimoItem: Integer;
  nNovoId: Integer;
begin
  nUltimoItem := Pred(FXMLResponseType.Result.Count);
  FXmlItemType := FXMLResponseType.Result.Item[nUltimoItem];
  nNovoId := Succ(FXmlItemType.Id);
  Result := IntToStr(nNovoId);
end;

procedure TControlarXml.Salvar;
begin
  ValidarDados;

  if FValorSendoAlterado then
  begin
    FXMLItemType := FXMLResponseType.Result.Item[FIndice]
  end
  else
  begin
    FXMLItemType := FXMLResponseType.Result.Add;
    FIndice := Succ(FIndice);
  end;

  FXMLITemType.Id := StrToInt(FId.Text);
  FXMLItemType.First_name := FNome.Text;
  FXMLItemType.Last_name := FSobrenome.Text;
  FXMLItemType.Gender := FGenero.Text;
  FXMLItemType.Dob := FormatDateTime('dd/mm/yyyy',FDataNascimento.Date);
  FXMLItemType.Email := FEmail.Text;
  FXMLItemType.Phone := FTelefone.Text;
  FXMLItemType.Website := FWebsite.Text;
  FXMLItemType.Address := FEndereco.Text;
  FXMLItemType.Status := FStatus.Text;

  SalvarArquivoXml;
  ShowMessage('Registro Salvo!');
  FAdicionandoRegistro := False;
  ControlarBotoes;
end;

procedure TControlarXml.SalvarArquivoXml;
begin
  FXMLDocument.SaveToFile('../../xmlMissao20.xml');
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
  ControlarBotoes;
  SalvarArquivoXml;
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
