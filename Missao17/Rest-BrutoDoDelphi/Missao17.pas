unit Missao17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Json;

type
  TRepository = class
  private
    [JSONName('id')]
    FId: Int64;
    [JSONName('name')]
    FName: string;
    [JSONName('html_url')]
    FUrl: string;
    [JSONName('description')]
    FDescription: string;
  public
    property Id: Int64 read FId;
    property Name: string read FName;
    property Url: string read FUrl;
    property Description: string read FDescription;
  end;

  TRepositories = class
  private
    [JSONName('items')]
    FRepositories: TArray<TRepository>;
  public
    Destructor Destroy; override;

    property Repositories: TArray<TRepository> read FRepositories;
  end;

  TuForm = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    mmResultado: TMemo;
    lbInformarValor: TLabel;
    edtValor: TEdit;
    btConsultar: TButton;
    procedure btConsultarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregarApi;
  public
    { Public declarations }
  end;

var
  uForm: TuForm;

implementation

{$R *.dfm}

procedure TuForm.btConsultarClick(Sender: TObject);
begin
  CarregarApi;
end;

procedure TuForm.CarregarApi;
var
  oRepositories: TRepositories;
  oRepository: TRepository;
  sResultado: String;
begin
  RESTRequest.Params.AddUrlSegment('busca', edtValor.Text);
  RESTRequest.Execute;
  mmResultado.Lines.Clear;
  //mmResultado.Lines.Add(RESTResponse.JSONText);
  sResultado := RESTResponse.JSONText;
  edtValor.Clear;
  edtValor.SetFocus;

  oRepositories := TJson.JsonToObject<TRepositories>(sResultado);
  try
    for oRepository in oRepositories.Repositories do
      begin
        Writeln('==============================================================');
        Writeln('Id: ' + oRepository.Id.ToString);
        Writeln('Name: ' + oRepository.Name);
        Writeln('Html_url: ' + oRepository.Url);
        Writeln('Description: ' + oRepository.Description);
      end;
      Writeln('==============================================================');
  finally
    oRepositories.Free;
  end;
end;

procedure TuForm.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btConsultarClick(Sender);
end;

{ TRepositories }

destructor TRepositories.Destroy;
var
  oRepository: TRepository;
begin
  for oRepository in Self.FRepositories do
    oRepository.Free;

  inherited;
end;

end.
