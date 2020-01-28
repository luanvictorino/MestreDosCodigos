//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 13/12/2019                                      //
//  Miss�o: Em uma aplica��o console, escreva uma classe    //
//          que implemente o algoritmo de pilha. Esta       //
//          classe dever� utilizar Generics para poder      //
//          armazenar qualquer tipo de conte�do e conter os //
//          m�todos Push, Pop, Size e IsEmpty. Ap�s a       //
//          implementa��o da classe, fa�a:                  //
//            - Construa dois objetos. Um deve armazenar    //
//              strings e outro deve armazenar inteiros;    //
//            - Adicione tr�s strings aleat�rias e 15       //
//              n�meros aleat�rios (podem ser entradas do   //
//              usu�rio);                                   //
//            - Imprima o retorno da fun��o Size dos dois   //
//              objetos;                                    //
//            - Execute o m�todo Push da pilha de strings,  //
//              mostrando o resultado no console, at� que a //
//              pilha esteja vazia;                         //
//            - Fa�a o mesmo procedimento com a pilha de    //
//              inteiros;                                   //
//            - Imprima o retorno da fun��o Size dos dois   //
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
      Write('Digite o '+(Succ(oPilhaString.Size).ToString)+'� valor: ');
      Readln(sValor);

      if sValor.IsEmpty then
      begin
        Writeln('Valor inv�lido!!');
        Continue;
      end;

      oPilhaString.Push(sValor);
      if oPilhaString.Size = 3 then
        Break;
    until False;

    Writeln(EmptyStr);
    Writeln('Digite 15 valores num�ricos: ');
    repeat
      sValor := '';
      Write('Digite o '+(Succ(oPilhaInteger.Size).ToString)+'� valor: ');
      Readln(sValor);

      if sValor.IsEmpty then
      begin
        Writeln('Valor inv�lido!!');
        Continue;
      end;

      try
        nValor := StrToInt(sValor);
      except
        Writeln('Valor inv�lido!!');
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
