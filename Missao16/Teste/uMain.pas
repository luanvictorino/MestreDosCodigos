unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uClassReader;

type
  TfMain = class(TForm)
    mmMethods: TMemo;
    mmProperties: TMemo;
    lbMethods: TLabel;
    lbProperties: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FClassReader: TClassReader;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
begin
  FClassReader := TClassReader.Create;
  FClassReader.GetMethods<TStringList>(mmMethods.Lines);
  FClassReader.GetProperties<TStringList>(mmProperties.Lines);
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  FClassReader.Free;
end;

end.
