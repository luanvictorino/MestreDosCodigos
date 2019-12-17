//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 13/12/2019                                      //
// Mission: Em uma aplicação console, crie uma classe que   //
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
  uClasseMatematica in 'uClasseMatematica.pas';

procedure main;
var
  oClasseMatematica: TClasseMatematica;
  sOperacao: string;
  nEsquerda: double;
  nDireita: double;
begin
  repeat
    Write('Informe um dos seguintes tipos de operações [+][-][*][/]: ');
    readln(sOperacao);

    if (MatchStr(sOperacao[1],['+','-','*','/'])) and (Length(sOperacao)=1) then
      break;

    Writeln('Operação inválida! Digite novamente.');
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
    Writeln('O resultado da operação matemática é: '+
            oClasseMatematica.OperacaoMatematica.ToString);
  finally
    oClasseMatematica.Free;
  end;
  readln;
end;

begin
  main;
end.
