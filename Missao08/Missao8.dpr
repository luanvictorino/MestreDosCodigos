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
//            - Execute o m�todo Pop da pilha de strings,  //
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
  System.Generics.Collections,
  uPilha in 'uPilha.pas';

procedure LimparPilhaInteger(const pPilha: TPilha<Integer>);
const
  sESVAZIA_PILHA = 'Removendo Integer: ';
begin
  Writeln(EmptyStr);
  while not(pPilha.IsEmpty) do
    Writeln(sESVAZIA_PILHA + pPilha.Pop.ToString);
end;

procedure LimparPilhaString(const pPilha: TPilha<String>);
const
  sESVAZIA_PILHA = 'Removendo String: ';
begin
  Writeln(EmptyStr);
  while not(pPilha.IsEmpty) do
    Writeln(sESVAZIA_PILHA + pPilha.Pop);
end;

function RetornarEntradaUsuarioString(const mensagem: String): string;
var
  sValor: string;
begin
  Write(mensagem);
  Readln(sValor);
  if sValor.IsEmpty then
  begin
    Writeln('Valor inv�lido!!');
    Result := RetornarEntradaUsuarioString(mensagem);
    Exit;
  end;
  Result := sValor;
end;

procedure CarregarPilhaComStrings(const pPilhaString: TPilha<string>);
const
  sPEDE_VALOR = 'Informe o %d� valor: ';
  nTAMANHO_MAXIMO_PILHA = 3;
var
  sValor: String;
  nTamanhoPilha: Integer;
  sMensagem: String;
begin
  Writeln('Informe 3 valores String');
  nTamanhoPilha := 0;
  while nTamanhoPilha < nTAMANHO_MAXIMO_PILHA do
  begin
    sMensagem := Format(sPEDE_VALOR, [Succ(nTamanhoPilha)]);
    sValor := RetornarEntradaUsuarioString(sMensagem);
    pPilhaString.Push(sValor);
    Inc(nTamanhoPilha);
  end;
end;

function RetornarEntradaUsuarioInteger(const Mensagem: String): Integer;
var
  sValor: String;
  nValor: Integer;
begin
  Write(mensagem);
  Readln(sValor);
  if (sValor.IsEmpty) or not(TryStrToInt(sValor, nValor)) then
  begin
    Writeln('Valor inv�lido!!');
    Result := RetornarEntradaUsuarioInteger(Mensagem);
    Exit;
  end;
  Result := nValor;
end;

procedure CarregarPilhaComIntegers(const pPilhaInteger: TPilha<Integer>);
const
  sPEDE_VALOR = 'Informe o %d� valor: ';
  nTAMANHO_MAXIMO_PILHA = 15;
var
  nValor: Integer;
  nTamanhoPilha: Integer;
  sMensagem: String;
begin
  Writeln(EmptyStr);
  Writeln('Informe 15 valores num�ricos');
  nTamanhoPilha := 0;
  while nTamanhoPilha < nTAMANHO_MAXIMO_PILHA do
  begin
    sMensagem := Format(sPEDE_VALOR, [Succ(nTamanhoPilha)]);
    nValor := RetornarEntradaUsuarioInteger(sMensagem);
    pPilhaInteger.Push(nValor);
    Inc(nTamanhoPilha);
  end;
end;

procedure main;
var
  oPilhaInteger: TPilha<Integer>;
  oPilhaString: TPilha<String>;
begin
  oPilhaInteger := TPilha<Integer>.Create;
  oPilhaString := TPilha<String>.Create;
  try
    CarregarPilhaComStrings(oPilhaString);
    CarregarPilhaComIntegers(oPilhaInteger);

    Writeln(EmptyStr);
    Writeln('Pilha de String quantidade: '+ oPilhaString.Size.ToString);
    Writeln('pilha de Integer quantidade: '+ oPilhaInteger.Size.ToString);

    LimparPilhaString(oPilhaString);
    LimparPilhaInteger(oPilhaInteger);

    Writeln(EmptyStr);
    Writeln('Pilha de String quantidade: '+ oPilhaString.Size.ToString);
    Writeln('pilha de Integer quantidade: '+ oPilhaInteger.Size.ToString);
    Readln;
  finally
    oPilhaString.Free;
    oPilhaInteger.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
