unit uLeitorClasse;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  System.TypInfo, System.RTTI;

type
  TLeitorClasse = class
    function NomeClasse<T>: String;
    function PegarPropriedades<T>: TList<String>;
    function PegarMetodos<T>: TList<String>;
    procedure ListarPropriedades<T>(pLista: TStrings);
    procedure ListarMetodos<T>(pLista: TStrings);
  end;

implementation

{ TLeitorClasse }

function TLeitorClasse.NomeClasse<T>: String;
var
  rContexto: TRttiContext;
  oTipo: TRttiType;
begin
  rContexto := TRttiContext.Create;
  oTipo := rContexto.GetType(TypeInfo(T));
  Result := oTipo.Name;
end;

function TLeitorClasse.PegarPropriedades<T>: TList<String>;
var
  rContexto: TRttiContext;
  oTipo: TRttiType;
  oPropriedade: TRttiProperty;
begin
  rContexto := TRttiContext.Create;
  oTipo := rContexto.GetType(TypeInfo(T));

  Result := TList<String>.Create;
  for oPropriedade in oTipo.GetProperties do
    Result.Add(oPropriedade.Name);
end;

function TLeitorClasse.PegarMetodos<T>: TList<String>;
var
  rContexto: TRttiContext;
  oTipo: TRttiType;
  oMetodo: TRttiMethod;
begin
  rContexto := TRttiContext.Create;
  oTipo := rContexto.GetType(TypeInfo(T));

  Result := TList<String>.Create;
  for oMetodo in oTipo.GetMethods do
    Result.Add(oMetodo.Name);
end;

procedure TLeitorClasse.ListarPropriedades<T>(pLista: TStrings);
var
  oLista: TList<String>;
  sItem: String;
begin
  oLista := PegarPropriedades<T>;
  try
    for sItem in oLista do
      pLista.Add(sItem);
  finally
    oLista.Free;
  end;
end;

procedure TLeitorClasse.ListarMetodos<T>(pLista: TStrings);
var
  oLista: TList<String>;
  sItem: String;
begin
  oLista := PegarMetodos<T>;
  try
    for sItem in oLista do
      pLista.Add(sItem);
  finally
    oLista.Free;
  end;
end;

end.
