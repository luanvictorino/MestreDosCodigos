unit uMissao20;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, uManipularXml;

type
  TfMissao20 = class(TForm)
    pnDados: TPanel;
    pnBotoes: TPanel;
    btnPrimeiro: TSpeedButton;
    btnProximo: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnCarregarXml: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    gbDadosRegistro: TGroupBox;
    lbStatus: TLabel;
    lbEndereco: TLabel;
    lbWebsite: TLabel;
    lbTelefone: TLabel;
    lbEmail: TLabel;
    lbDataNascimento: TLabel;
    lbGenero: TLabel;
    lbSobrenome: TLabel;
    lbNome: TLabel;
    lbId: TLabel;
    edtId: TEdit;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    cbGenero: TComboBox;
    dtpDataNascimento: TDateTimePicker;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    edtWebsite: TEdit;
    edtEndereco: TEdit;
    cbStatus: TComboBox;
    lbControlarRegistrosXML: TLabel;
    procedure btnCarregarXmlClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    oControlarXml: TControlarXml;
  public
  end;

var
  fMissao20: TfMissao20;

implementation

uses
  xmlMissao20;

{$R *.dfm}

procedure TfMissao20.FormCreate(Sender: TObject);
begin
  oControlarXml := TControlarXml.Create(edtId, edtNome, edtSobrenome, cbGenero,
                     dtpDataNascimento, edtEmail, edtTelefone, edtWebsite,
                     edtEndereco, cbStatus, btnPrimeiro, btnAnterior, btnProximo,
                     btnUltimo, btnCarregarXml, btnAdicionar, btnSalvar, btnRemover);
end;

procedure TfMissao20.btnPrimeiroClick(Sender: TObject);
begin
  oControlarXml.Primeiro;
end;

procedure TfMissao20.btnAnteriorClick(Sender: TObject);
begin
  oControlarXml.Anterior;
end;

procedure TfMissao20.btnProximoClick(Sender: TObject);
begin
  oControlarXml.Proximo;
end;

procedure TfMissao20.btnUltimoClick(Sender: TObject);
begin
  oControlarXml.Ultimo;
end;

procedure TfMissao20.btnCarregarXmlClick(Sender: TObject);
begin
  oControlarXml.CarregarXml;
end;

procedure TfMissao20.btnAdicionarClick(Sender: TObject);
begin
  oControlarXml.Adicionar;
end;

procedure TfMissao20.btnRemoverClick(Sender: TObject);
begin
  oControlarXml.Remover;
end;

procedure TfMissao20.btnSalvarClick(Sender: TObject);
begin
  oControlarXml.Salvar;
end;

procedure TfMissao20.FormDestroy(Sender: TObject);
begin
  if Assigned(oControlarXml) then
    oControlarXml.Free;
end;

end.
