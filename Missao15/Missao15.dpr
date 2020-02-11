//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 03/01/2020                                      //
//  Miss�o: Crie uma aplica��o console. Em uma unit, crie   //
//          uma classe TNotepad, com o m�todo Executar.     //
//          Este m�todo dever� abrir o bloco de notas para  //
//          o usu�rio. Em outro arquivo, escreva a classe   //
//          TCriadorMagico que, utilizando RTTI, construa   //
//          uma inst�ncia de TNotepad de forma din�mica,    //
//          apenas pelo seu QualifiedClassName, sem         //
//          adicion�-la � se��o uses. Na unit do projeto,   //
//          crie uma inst�ncia de TCriadorMagico para abrir //
//          o bloco de notas.                               //
//////////////////////////////////////////////////////////////
program Missao15;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uNotepad in 'uNotepad.pas',
  uCriadorMagico in 'uCriadorMagico.pas';

procedure Main;
begin
  TCriadorMagico.AbrirNotepad;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
