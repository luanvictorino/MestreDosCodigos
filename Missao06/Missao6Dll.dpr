library Missao6Dll;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function CalcularAreaTriangulo(nBase, nAltura: Real): Real; stdcall;
begin
  Result := (nBase*nAltura)/2;
end;

function CalcularAreaQuadradoRetangulo(nBase, nAltura: Real):Real; stdcall;
begin
  Result := nBase*nAltura;
end;

function CalcularAreaCirculo(nRaio: Real): Real; stdcall;
const
  nPI = 3.14;
begin
  Result := (nRaio*nRaio)*nPI;
end;

exports
  CalcularAreaTriangulo,
  CalcularAreaQuadradoRetangulo,
  CalcularAreaCirculo;

end.
