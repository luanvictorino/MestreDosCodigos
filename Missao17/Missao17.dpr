//////////////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                          //
//    Data: 06/01/2020                                              //
//  Missão: A partir de uma sentença digitada pelo usuário,         //
//          execute a pesquisa na API do GitHub                     //
//          (https://api.github.com/search/repositories?q={busca}), //
//          substituindo o texto {busca} pela entrada do usuário.   //
//          Carregue a resposta da API em um objeto com os          //
//          seguintes campos: id, name, html_url e description. Por //
//          fim, liste todas as ocorrências encontradas para o      //
//          usuário. A aplicação pode ser console ou VCL.           //
//////////////////////////////////////////////////////////////////////
program Missao17;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ShellApi,
  REST.Client,
  REST.Json,
  Json,
  Winapi.Windows,
  uRest in 'uRest.pas';

procedure main;
var
  sValor : String;
  oRest: TTestandoRest;
  sResultado: String;
  sBaseUrl: String;
  sResource: String;
  sResourceSufix: String;
  LJsonObj   : TJSONObject;
  LJsonValue : TJSONValue;
begin
  Write('Informe um valor: ');
  Readln(sValor);
  {sBaseUrl := 'https://api.github.com';
  sResource := ('search');
  sResourceSufix := Format('repositorie',[sValor]);}


  oRest := TTestandoRest.Create;

  sResultado := oRest.GetURLAsString((Format(('https://api.github.com/search/repositories?q={%s}'),[sValor])));
  LJsonObj    := TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(sResultado),0) as TJSONObject;
  try
     LJsonValue := LJsonObj.Get('luan').JsonValue;
     sResultado:= LJsonValue.Value;
  finally
     LJsonObj.Free;
  end;



  {

  sResultado := oRest.CarregarApi(sBaseUrl, sResource, sResourceSufix);
  Write(sResultado);
  //ShellExecute(0, 'open', PCHar(sConsultaEndereco), nil, nil, SW_SHOWNORMAL);}

  readln;
end;

begin
  main;
end.
