{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit uMissao20;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, uControlarXml;

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
