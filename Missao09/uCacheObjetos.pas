unit uCacheObjetos;

interface

uses
  System.SysUtils, TypInfo, System.Generics.Collections;

type
  TCacheObjetos = class
  private
    FLista: TObjectDictionary<string, TObject>;
    function PegarNomeClasse<T: class>: String;
    function CriarInstancia<T: class, constructor>: T;
  public
    constructor Create;
    destructor Destroy; override;
    function RetornarInstancia<T: class, constructor>: T;
  end;

implementation

{ TClasseGenerica }

constructor TCacheObjetos.Create;
begin
  FLista := TObjectDictionary<string, TObject>.Create([doOwnsValues]);
end;

destructor TCacheObjetos.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TCacheObjetos.RetornarInstancia<T>: T;
var
  sNomeClasse: String;
  bContemInstancia: Boolean;
begin
  sNomeClasse := PegarNomeClasse<T>;
  bContemInstancia := FLista.ContainsKey(sNomeClasse);

  if bContemInstancia then
  begin
    Result := FLista.Items[sNomeClasse] as T;
    Exit;
  end;

  Result := CriarInstancia<T>;
end;

function TCacheObjetos.PegarNomeClasse<T>: String;
begin
  Result := GetTypeData(PTypeInfo(TypeInfo(T)))^.ClassType.QualifiedClassName;
end;

function TCacheObjetos.CriarInstancia<T>: T;
var
  sNomeClasse: String;
begin
  sNomeClasse := PegarNomeClasse<T>;
  Result := T.Create;
  FLista.Add(sNomeClasse, TObject(Result));
end;

end.
