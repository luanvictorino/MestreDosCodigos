//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 03/01/2020                                      //
//  Missão: Construa uma aplicação VCL. Esta aplicação      //
//          deverá conter uma classe que, utilizando RTTI,  //
//          faça a listagem das propriedades e métodos de   //
//          qualquer classe passada por parâmetro. A        //
//          apresentação da listagem fica por sua conta.    //
//////////////////////////////////////////////////////////////
unit uMissao16;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RTTI, System.Generics.Collections;

type
  TfMissao16 = class(TForm)
    lbPropriedades: TLabel;
    lbMetodos: TLabel;
    mmPropriedades: TMemo;
    mmMetodos: TMemo;
    lbClasse: TLabel;
    lbNomeClasse: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMissao16: TfMissao16;

implementation

{$R *.dfm}

uses uLeitorClasse;

{ TLeitorRTTI }

procedure TfMissao16.FormShow(Sender: TObject);
var
  oLeitorClasse: TLeitorClasse;
begin
  oLeitorClasse := TLeitorClasse.Create;
  try
    oLeitorClasse.ListarPropriedades<TButton>(mmPropriedades.Lines);
    oLeitorClasse.ListarMetodos<TButton>(mmMetodos.Lines);
    lbNomeClasse.Caption := oLeitorClasse.NomeClasse<TButton>;
  finally
    oLeitorClasse.Free;
  end;
end;

end.
