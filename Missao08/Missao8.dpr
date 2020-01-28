//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 13/12/2019                                      //
//  Missão: Em uma aplicação console, escreva uma classe    //
//          que implemente o algoritmo de pilha. Esta       //
//          classe deverá utilizar Generics para poder      //
//          armazenar qualquer tipo de conteúdo e conter os //
//          métodos Push, Pop, Size e IsEmpty. Após a       //
//          implementação da classe, faça:                  //
//            - Construa dois objetos. Um deve armazenar    //
//              strings e outro deve armazenar inteiros;    //
//            - Adicione três strings aleatórias e 15       //
//              números aleatórios (podem ser entradas do   //
//              usuário);                                   //
//            - Imprima o retorno da função Size dos dois   //
//              objetos;                                    //
//            - Execute o método Push da pilha de strings,  //
//              mostrando o resultado no console, até que a //
//              pilha esteja vazia;                         //
//            - Faça o mesmo procedimento com a pilha de    //
//              inteiros;                                   //
//            - Imprima o retorno da função Size dos dois   //
//              objetos;                                    //
//////////////////////////////////////////////////////////////
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
  try
    Writeln('Digite 3 valores String: ');
    repeat
      sValor := '';
      Write('Digite o '+(Succ(oPilhaString.Size).ToString)+'º valor: ');
      Readln(sValor);

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
      Write('Digite o '+(Succ(oPilhaInteger.Size).ToString)+'º valor: ');
      Readln(sValor);

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
  finally
    oPilhaString.Free;
    oPilhaInteger.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
