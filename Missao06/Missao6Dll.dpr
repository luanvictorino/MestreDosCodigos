library Missao6Dll;

uses
  System.SysUtils,
  System.Classes,
  System.Math;

{$R *.res}

function CalcularAreaTriangulo(const nBase, nAltura: Real): Real; stdcall;
begin
  Result := (nBase*nAltura)/2;
end;

function CalcularAreaQuadradoRetangulo(const nBase, nAltura: Real):Real; stdcall;
begin
  Result := nBase*nAltura;
end;

function CalcularAreaCirculo(const nRaio: Real): Real; stdcall;
begin
  Result := (nRaio*nRaio)*Pi;
end;

exports
  CalcularAreaTriangulo,
  CalcularAreaQuadradoRetangulo,
  CalcularAreaCirculo;

end.
