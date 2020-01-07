//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 19/10/2019                                      //
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
  System.Json;

type
  TStringListHelper = class helper for TStringList
  public
    function IsEmpty: Boolean;
    function HasDuplicate: Boolean;
    procedure ValidJSON;
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
  sItem: string;
begin
  sLista := TStringList.Create;
  try
    sLista.Sorted := True;
    sLista.Duplicates := dupIgnore;

    for sItem in Self do
      sLista.Add(sItem);

    Result := sLista.Count <> Self.Count;
  finally
    sLista.Free;
  end;
end;

function TStringListHelper.ToJSON: String;
var
  sValor: String;
  oJSON: TJSONObject;
  nIndex: Integer;
  nListaInteger: Double;
begin
  self.ValidJSON;
  oJSON := TJSONObject.Create;
  try
    for nIndex := 0 to (self.Count)-1 do
    begin
      sValor := self.ValueFromIndex[nIndex];
      if (sValor.ToLower.Trim = 'null') then
        oJSON.AddPair(Self.Names[nIndex],TJSONNull.Create)
      else if (sValor.ToLower.Trim = 'true') then
        oJSON.AddPair(Self.Names[nIndex],TJSONTrue.Create)
      else if (sValor.ToLower.Trim = 'false') then
        oJSON.AddPair(Self.Names[nIndex],TJSONFalse.Create)
      else
      begin
        try
          nListaInteger := StrToFloat(sValor);
          oJSON.AddPair(Self.Names[nIndex],TJSONNumber.Create(nListaInteger));
          continue;
        except
          raise Exception.Create('Valor inválido!');
        end;

        oJSON.AddPair(Self.Names[nIndex],Self.ValueFromIndex[nIndex]);
      end;
    end;

    Result := oJSON.ToString;
  finally
    oJSON.Free
  end;
end;

procedure TStringListHelper.ValidJSON;
var
  nIndex: Integer;
begin
  if self.IsEmpty then
    raise Exception.Create('Lista vazia!');;

  if self.HasDuplicate then
    raise Exception.Create('Valores duplicados!');

  for nIndex := 0 to (self.Count)-1 do
  begin
    if (self.Names[nIndex] = EmptyStr) or
       (self.ValueFromIndex[nIndex] = EmptyStr) then
      raise Exception.Create('Não foi possível converter o conteúdo!');
  end;
end;

procedure main;
begin
  Readln;
end;

begin
  main;
  ReportMemoryLeaksOnShutdown := True;
  Readln;
end.
