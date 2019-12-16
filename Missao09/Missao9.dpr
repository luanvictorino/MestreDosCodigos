//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 13/12/2019                                      //
// Mission: Em uma aplicação console, crie uma classe       //
//          chamada TFuncionario que armazene os dados de   //
//          funcionários (nome, email e telefone). Crie     //
//          também uma classe, utilizando Generics, chamada //
//          TCacheObjetos. O seu funcionamento será como um //
//          cache de objetos e deverá armazenar instâncias  //
//          de diferentes tipos. Sendo assim, caso o cache  //
//          não contenha uma instância da classe solicitada,//
//          TCacheObjetos deverá criá-la, armazenar no seu  //
//          cache interno e retornar a instância. Para      //
//          testar a aplicação, crie duas variáveis         //
//          (funcionario1 e funcionario2). Crie também uma  //
//          instância de TCacheObjetos e peça que ele       //
//          retorne uma instância de TFuncionario na        //
//          variável funcionario1. Preencha os valores do   //
//          funcionário. Em seguida, peça uma instância de  //
//          TFuncionario em funcionario2. Os valores das    //
//          duas variáveis deverão ser iguais, já que serão //
//          a mesma instância.                              //
//////////////////////////////////////////////////////////////
program Missao9;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFuncionario in 'uFuncionario.pas',
  uCacheObjetos in 'uCacheObjetos.pas';

begin
  
end.
