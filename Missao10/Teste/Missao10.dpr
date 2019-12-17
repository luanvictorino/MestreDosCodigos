//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 13/12/2019                                      //
// Mission: Em uma aplica��o console, crie uma classe que   //
//          executar� opera��es matem�ticas, chamada        //
//          TClasseMatematica. Ela ter� duas propriedades do//
//          tipo double, chamadas Esquerda e Direita, e     //
//          tamb�m uma propriedade que receber� um m�todo   //
//          an�nimo que referencie uma function, com retorno//
//          do tipo double (crie o tipo com o nome          //
//          TOperacaoMatematica). A aplica��o solicitar� ao //
//          usu�rio qual opera��o deve ser executada        //
//          (+ - * /) e os n�meros da opera��o (Esquerda e  //
//          Direita). De acordo com a entrada do usu�rio, a //
//          opera��o matem�tica correta ser� executada      //
//          atrav�s de um m�todo an�nimo, presente na       //
//          propriedade do tipo TOperacaoMatematica.        //
//////////////////////////////////////////////////////////////
program Missao10;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils,
  uClasseMatematica in 'uClasseMatematica.pas';

procedure main;
var
  oClasseMatematica: TClasseMatematica;
  sOperacao: string;
  nEsquerda: double;
  nDireita: double;
begin
  repeat
    Write('Informe um dos seguintes tipos de opera��es [+][-][*][/]: ');
    readln(sOperacao);

    if (MatchStr(sOperacao[1],['+','-','*','/'])) and (Length(sOperacao)=1) then
      break;

    Writeln('Opera��o inv�lida! Digite novamente.');
    continue;
  until False;

  Write('Informe o primeiro valor: ');
  readln(nEsquerda);

  Write('Informe o segundo valor: ');
  readln(nDireita);

  oClasseMatematica := TClasseMatematica.Create;
  try
    oClasseMatematica.Esquerda := nEsquerda;
    oClasseMatematica.Direita := nDireita;

    case sOperacao[1] of
      '+': oClasseMatematica.OperacaoMatematica :=
           function: double
           begin
             Result := oClasseMatematica.Esquerda + oClasseMatematica.Direita;
           end;
      '-': oClasseMatematica.OperacaoMatematica :=
           function: double
           begin
             Result := oClasseMatematica.Esquerda - oClasseMatematica.Direita;
           end;
      '*': oClasseMatematica.OperacaoMatematica :=
           function: double
           begin
             Result := oClasseMatematica.Esquerda * oClasseMatematica.Direita;
           end;
      '/': oClasseMatematica.OperacaoMatematica :=
           function: double
           begin
             Result := oClasseMatematica.Esquerda / oClasseMatematica.Direita;
           end;
    end;
    Writeln(EmptyStr);
    Writeln('O resultado da opera��o matem�tica �: '+
            oClasseMatematica.OperacaoMatematica.ToString);
  finally
    oClasseMatematica.Free;
  end;
  readln;
end;

begin
  main;
end.
