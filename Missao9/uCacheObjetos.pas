unit uCacheObjetos;

interface

uses
  System.Generics.Collections;

type
  TCacheObjetos = class
    FLista: TObjectDictionary<string, TObject>;
  end;

implementation

end.
