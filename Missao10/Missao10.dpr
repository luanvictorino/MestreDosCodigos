program Missao10;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uClasseMatematica in 'uClasseMatematica.pas';

procedure main;
var
  oClasseMatematica: TClasseMatematica;
  sOperacao: string;
  nEsquerda: double;
  nDireita: double;
begin
  Write('Informe um dos seguintes tipos de opera��es [+][-][*][\]: ');
  readln(sOperacao);

  Write('Informe o primeiro valor: ');
  readln(nEsquerda);

  Write('Informe o segundo valor: ');
  readln(nDireita);

  oClasseMatematica := TClasseMatematica.Create;
  try
    oClasseMatematica.Esquerda := nEsquerda;
    oClasseMatematica.Direita := nDireita;

    if sOperacao = '+' then
    oClasseMatematica.OperacaoMatematica :=
    function: double
    begin
      Result := oClasseMatematica.Esquerda + oClasseMatematica.Direita;
    end;

    if sOperacao = '-' then
    oClasseMatematica.OperacaoMatematica :=
    function: double
    begin
      Result := oClasseMatematica.Esquerda - oClasseMatematica.Direita;
    end;

    if sOperacao = '*' then
    oClasseMatematica.OperacaoMatematica :=
    function: double
    begin
      Result := oClasseMatematica.Esquerda * oClasseMatematica.Direita;
    end;

    if sOperacao = '/' then
    oClasseMatematica.OperacaoMatematica :=
    function: double
    begin
      Result := oClasseMatematica.Esquerda / oClasseMatematica.Direita;
    end;

    Writeln('O resultado da opera��o matem�tica �: '+ oClasseMatematica.OperacaoMatematica.ToString);
  finally
    oClasseMatematica.Free;
  end;

  readln;
end;

begin
  main;
end.
