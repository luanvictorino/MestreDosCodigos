program Missao8;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uPilha in 'uPilha.pas';

procedure main;
var
  oPilhaInteger: TPilha<Integer>;
  oPilhaString: TPilha<String>;
  sValor: String;
  nValor: Integer;
begin
  oPilhaInteger := TPilha<Integer>.Create;
  oPilhaString := TPilha<String>.Create;

  Writeln('Digite 3 valores String: ');
  repeat
    sValor := '';
    Write('Digite o '+IntToStr((oPilhaString.Size)+1)+'º valor: ');
    readln(sValor);

    if sValor.IsEmpty then
    begin
      Writeln('Valor inválido!!');
      Continue;
    end;

    oPilhaString.Push(sValor);
    if oPilhaString.Size = 3 then
      Break;
  until False;

  Writeln(EmptyStr);
  Writeln('Digite 15 valores numéricos: ');
  repeat
    sValor := '';
    Write('Digite o '+IntToStr((oPilhaInteger.Size)+1)+'º valor: ');
    readln(sValor);

    if sValor.IsEmpty then
    begin
      Writeln('Valor inválido!!');
      Continue;
    end;

    try
      nValor := StrToInt(sValor);
    except
      Writeln('Valor inválido!!');
      Continue;
    end;

    oPilhaInteger.Push(nValor);
    if oPilhaInteger.Size = 15 then
      Break;
  until False;

  Writeln(EmptyStr);
  Writeln('Pilha de String quantidade: '+ oPilhaString.Size.ToString);
  Writeln('pilha de Integer quantidade: '+ oPilhaInteger.Size.ToString);

  Writeln(EmptyStr);
  while not(oPilhaString.IsEmpty) do
    Writeln('Removendo String: '+ oPilhaString.Pop);

  while not(oPilhaInteger.IsEmpty) do
    Writeln('Removendo Integer: '+ oPilhaInteger.Pop.ToString);

  Writeln(EmptyStr);
  Writeln('Pilha de String quantidade: '+ oPilhaString.Size.ToString);
  Writeln('pilha de Integer quantidade: '+ oPilhaInteger.Size.ToString);
  Readln;
end;

begin
  main;
end.
