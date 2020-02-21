//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 19/12/2019                                      //
//  Missão: Criar um Class Helper para a classe TStringList //
//          com as seguintes funções:                       //
//            IsEmpty: Verifica se lista está vazia;        //
//            HasDuplicate: Verifica se a lista contém      //
//              valores duplicados;                         //
//            ToJSON: Verifica se o conteúdo da Lista está  //
//              no formato Nome=Valor. Caso esteja,         //
//              transforme o conteúdo conforme a notação    //
//              JSON e retorne como string (não é necessário//
//              utilizar as classes nativas neste momento). //
//              Caso não esteja, lance uma exceção          //
//              informando que não foi possível converter o //
//              conteúdo.                                   //
//////////////////////////////////////////////////////////////
program Missao12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.Json;

type
  TStringListHelper = class helper for TStringList
  private
    function ValidarFormatoChaveEValor: boolean;
    function RetornaJsonValido(const sValor: string): TJSONValue;
  public
    function IsEmpty: Boolean;
    function HasDuplicate: Boolean;
    function ToJSON: String;
  end;

{ TStringListHelper }

function TStringListHelper.IsEmpty: Boolean;
begin
  Result := Count = 0;
end;

function TStringListHelper.HasDuplicate: Boolean;
var
  sLista: TStringList;
begin
  sLista := TStringList.Create;
  try
    sLista.Sorted := True;
    sLista.Duplicates := dupIgnore;
    sLista.AddStrings(Self);
    Result := sLista.Count <> Self.Count;
  finally
    FreeAndNil(sLista);
  end;
end;

function TStringListHelper.ToJSON: String;
var
  oJSON: TJSONObject;
  nIndex: Integer;
begin
  Result := 'Formato inválido para converter em JSON!';
  if ValidarFormatoChaveEValor then
  begin
    oJSON := TJSONObject.Create;
    try
      for nIndex := 0 to Pred(Self.Count) do
      begin
        oJSON.AddPair(Self.Names[nIndex], RetornaJSONValido(Self.ValueFromIndex[nIndex]));
      end;
      Result := oJSON.ToString;
    finally
      FreeAndNil(oJSON);
    end;
  end;
end;

function TStringListHelper.ValidarFormatoChaveEValor: Boolean;
var
  nPosicao: Integer;
begin
  Result := True;
  for nPosicao := 0 to Pred(Self.Count) do
  begin
    if (Self.ValueFromIndex[nPosicao] = EmptyStr) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TStringListHelper.RetornaJsonValido(const sValor: string): TJSONValue;
var
  oValorJson: TJSONValue;
begin
  if (sValor.ToLower.Trim = EmptyStr) then
    oValorJson := TJSONNull.Create
  else if (sValor.ToLower.Trim = 'true') then
    oValorJson := TJSONTrue.Create
  else if (sValor.ToLower.Trim = 'false') then
    oValorJson := TJSONFalse.Create
  else if StrToFloatDef(sValor, NegativeValue) > NegativeValue then
    oValorJson := TJSONNumber.Create(StrToFloat(sValor))
  else
    oValorJson := TJSONString.Create(sValor);

  Result := oValorJson;
end;

procedure main;
var
  oLista: TStringList;
begin
  oLista := TStringList.Create;
  try
    if oLista.IsEmpty then
      Writeln('Lista Vazia!');

    oLista.Add('Inválido= ');
    Writeln(oLista.ToJSON);

    if oLista.HasDuplicate then
      Writeln('Valores duplicados!');

    oLista.Clear;
    oLista.Add('Cidade = Japura');
    oLista.Add('Codigo = 1');
    oLista.Add('Nome = Luan');
    oLista.Add('Ativo = True');
    oLista.Add('Contato = ');

    Writeln(oLista.ToJSON);
    Readln;
  finally
    oLista.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
