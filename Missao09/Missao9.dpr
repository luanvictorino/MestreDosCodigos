//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
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

procedure main;
var
  oCacheObjetos: TCacheObjetos;
  oFuncionario1: TFuncionario;
  oFuncionario2: TFuncionario;
begin
  oCacheObjetos := TCacheObjetos.Create;
  try
    oFuncionario1 := oCacheObjetos.RetornarInstancia<TFuncionario>;
    oFuncionario1.Nome := 'Luan';
    oFuncionario1.Email := 'luan@db1.com.br';
    oFuncionario1.Telefone := '(44) 3635-1914';
    Writeln('Objeto Funcionario1 criado e valores preenchidos:');
    Writeln('Nome: ' + oFuncionario1.Nome);
    Writeln('Email: ' + oFuncionario1.Email);
    Writeln('Telefone: ' + oFuncionario1.Telefone);

    Writeln(EmptyStr);
    oFuncionario2 := oCacheObjetos.RetornarInstancia<TFuncionario>;
    Writeln('Objeto Funcionario2 criado e valores preenchidos:');
    Writeln('Nome: ' + oFuncionario2.Nome);
    Writeln('Email: ' + oFuncionario2.Email);
    Writeln('Telefone: ' + oFuncionario2.Telefone);

    oFuncionario2.Nome := 'Luan Victorino';
    oFuncionario2.Email := 'luan.victorino@db1.com.br';
    oFuncionario2.Telefone := '(44) 99736-6195';
    Writeln(EmptyStr);
    Writeln('Valores de Funcionario2 alterados.');
    Writeln('Funcionário1: ');
    Writeln('Nome: ' + oFuncionario1.Nome);
    Writeln('Email: ' + oFuncionario1.Email);
    Writeln('Telefone: ' + oFuncionario1.Telefone);
    Writeln(EmptyStr);
    Writeln('Funcionário2: ');
    Writeln('Nome: ' + oFuncionario2.Nome);
    Writeln('Email: ' + oFuncionario2.Email);
    Writeln('Telefone: ' + oFuncionario2.Telefone);
    readln;
  finally
    oCacheObjetos.Free;
    FreeAndNil(oFuncionario1);
    FreeAndNil(oFuncionario2);
  end;
  readln;
end;

begin
  main;
end.
