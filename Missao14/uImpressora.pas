unit uImpressora;

interface

type
  IScanner = interface(IInterface)
    ['{1380AA4B-CF42-4212-8B98-9F21DFE19E2F}']
  end;

  IFax = interface(IInterface)
    ['{7CA9FE92-B19C-41BC-A883-4BE46C47384D}']
  end;

  ICopiadora = interface(IInterface)
    ['{98F17AD1-62AC-42CD-820C-7FC7671803FC}']
  end;

  IPrinter = interface(IInterface)
    ['{9D2FDE28-4DD6-43CB-84E0-5515503A0A60}']
  end;

  TMultifuncional = class(TInterfacedObject, IScanner, IFax, ICopiadora, IPrinter)
  end;

  TDispositivo = class
  private
    FCor: String;
    FAtivo: Boolean;
    FDataCompra: TDate;
    FModelo: String;
    FDataCadastro: TDate;
    FTipoDisposivito: String;
    FMarca: String;
    FNumeroSerie: String;
  public
    property Marca: String read FMarca write FMarca;
    property Modelo: String read FModelo write FModelo;
    property Cor: String read FCor write FCor;
    property NumeroSerie: String read FNumeroSerie write FNumeroSerie;
    property DataCompra: TDate read FDataCompra write FDataCompra;
    property DataCadastro: TDate read FDataCadastro write FDataCadastro;
    property Ativo: Boolean read FAtivo write FAtivo;
    property TipoDisposivito: String read FTipoDisposivito write FTipoDisposivito;
  end;

  TImpressora = class(TDispositivo)
  private
    FMultifuncional: TMultifuncional;
  public
    constructor Create;
    property Multifuncional: TMultifuncional read FMultifuncional write FMultifuncional;
  end;

implementation

{ TImpressora }

constructor TImpressora.Create;
begin
  FMultifuncional := TMultifuncional.Create;
end;

end.
