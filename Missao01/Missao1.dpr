program Missao1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function CalcularFatorial(nValor: Int64): String;
var
  nContador: Int64;
  nFatorial: Int64;
begin
  nFatorial := 1;
  for nContador := nValor downto 1 do
    nFatorial := nFatorial * nContador;

  Result := IntToStr(nFatorial);
end;

procedure main;
var
  nValor: Int64;
begin
  repeat
    Write('Informe um valor de 0 a 20 para descobrir seu fatorial: ');
    readln(nValor);

    if nValor in [0..20] then
      Break;

    Writeln('Valor inv�lido!');
    Continue;
  until False;

  Writeln('O fatorial de ' + IntToStr(nValor) + ' �: ' + CalcularFatorial(nValor));
  readln;
end;

begin
  main;
end.
