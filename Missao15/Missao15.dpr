//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 03/01/2020                                      //
//  Missão: Crie uma aplicação console. Em uma unit, crie   //
//          uma classe TNotepad, com o método Executar.     //
//          Este método deverá abrir o bloco de notas para  //
//          o usuário. Em outro arquivo, escreva a classe   //
//          TCriadorMagico que, utilizando RTTI, construa   //
//          uma instância de TNotepad de forma dinâmica,    //
//          apenas pelo seu QualifiedClassName, sem         //
//          adicioná-la à seção uses. Na unit do projeto,   //
//          crie uma instância de TCriadorMagico para abrir //
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
