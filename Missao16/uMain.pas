//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 03/01/2020                                      //
//  Miss�o: Construa uma aplica��o VCL. Esta aplica��o      //
//          dever� conter uma classe que, utilizando RTTI,  //
//          fa�a a listagem das propriedades e m�todos de   //
//          qualquer classe passada por par�metro. A        //
//          apresenta��o da listagem fica por sua conta.    //
//////////////////////////////////////////////////////////////
unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RTTI, System.Generics.Collections;

type
  TfrmMain = class(TForm)
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
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uLeitorClasse;

{ TLeitorRTTI }

procedure TfrmMain.FormShow(Sender: TObject);
var
  oLeitorClasse: TLeitorClasse;
begin
  oLeitorClasse := TLeitorClasse.Create;
  try
    oLeitorClasse.ListarPropriedades<TMemo>(mmPropriedades.Lines);
    oLeitorClasse.ListarMetodos<TMemo>(mmMetodos.Lines);
    lbNomeClasse.Caption := oLeitorClasse.NomeClasse<TMemo>;
  finally
    oLeitorClasse.Free;
  end;
end;

end.
