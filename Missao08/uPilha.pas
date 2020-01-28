unit uPilha;

interface

uses
  System.Generics.Collections,
  System.Math;

type
  TPilha<T> = class
  private
    FLista: TList<T>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Push(pValor: T);
    function Pop: T;
    function Size: Integer;
    function IsEmpty: Boolean;
  end;

implementation

{ TPilha<T> }

constructor TPilha<T>.Create;
begin
  FLista := TList<T>.Create;
end;

destructor TPilha<T>.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TPilha<T>.Push(pValor: T);
begin
  FLista.Add(pValor);
end;

function TPilha<T>.Pop: T;
begin
  Result := FLista.Last;
  FLista.Delete(Pred(Size));
end;

function TPilha<T>.Size: Integer;
begin
  Result := FLista.Count;
end;

function TPilha<T>.IsEmpty: Boolean;
begin
  Result := FLista.Count = 0;
end;

end.
