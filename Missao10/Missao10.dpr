//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//   Data: 13/12/2019                                      //
// Miss�o: Em uma aplica��o console, crie uma classe que   //
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
  System.Math,
  uClasseMatematica in 'uClasseMatematica.pas';

function LerValor(const pDescricao: String): Double;
var
  sValor: String;
  nValor: Double;
begin
  repeat
    Write(pDescricao + ': ');
    Readln(sValor);
    nValor := StrToFloatDef(sValor, ZeroValue);
  until nValor <> ZeroValue;
  Result := nValor
end;

function OperacaoValida(const pOperacao: String): Boolean;
begin
  Result := (MatchStr(pOperacao[1], ['+','-','*','/'])) and (Length(pOperacao) = 1);
  if not Result then
    Writeln('Opera��o inv�lida! Digite novamente.');

  Writeln(EmptyStr);
end;

procedure main;
var
  oClasseMatematica: TClasseMatematica;
  sOperacao: string;
begin
  repeat
    Write('Informe um dos seguintes tipos de opera��es [+][-][*][/]: ');
    Readln(sOperacao);
  until OperacaoValida(sOperacao);

  oClasseMatematica := TClasseMatematica.Create;
  try
    oClasseMatematica.Esquerda := LerValor('Esquerda');
    oClasseMatematica.Direita := LerValor('Direita');

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
    Readln;
  finally
    oClasseMatematica.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
