//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//   Data: 13/12/2019                                      //
// Missão: Em uma aplicação console, crie uma classe que   //
//          executará operações matemáticas, chamada        //
//          TClasseMatematica. Ela terá duas propriedades do//
//          tipo double, chamadas Esquerda e Direita, e     //
//          também uma propriedade que receberá um método   //
//          anônimo que referencie uma function, com retorno//
//          do tipo double (crie o tipo com o nome          //
//          TOperacaoMatematica). A aplicação solicitará ao //
//          usuário qual operação deve ser executada        //
//          (+ - * /) e os números da operação (Esquerda e  //
//          Direita). De acordo com a entrada do usuário, a //
//          operação matemática correta será executada      //
//          através de um método anônimo, presente na       //
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
    Writeln('Operação inválida! Digite novamente.');

  Writeln(EmptyStr);
end;

procedure main;
var
  oClasseMatematica: TClasseMatematica;
  sOperacao: string;
begin
  repeat
    Write('Informe um dos seguintes tipos de operações [+][-][*][/]: ');
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
    Writeln('O resultado da operação matemática é: '+
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
