unit DModul;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDataModule1 = class(TDataModule)
    ZConnection: TZConnection;
    QueryPengurus: TZQuery;
    QueryPeralatan: TZQuery;
    QueryPengurusnm_pengurus: TWideStringField;
    QueryPenguruspassword: TWideStringField;
    QueryPeralatannm_brg: TWideStringField;
    QueryPeralatanukuran: TWideStringField;
    QueryPeralatanno_prmbp: TWideStringField;
    QueryPeralatanm_manfaat: TWideStringField;
    QueryPeralatanth_pembelian: TIntegerField;
    QueryPeralatankd_bag: TWideStringField;
    QueryPeralatanhrg_perolehan: TIntegerField;
    QueryPeralatantgl_input: TDateField;
    DSPeralatan: TDataSource;
    QueryPeralatankd_brg: TWideStringField;
    QueryPeralatankd_merk: TWideStringField;
    QueryMerk: TZQuery;
    QueryBagian: TZQuery;
    QueryPegawai: TZQuery;
    QueryKategori: TZQuery;
    QueryPemakaian: TZQuery;
    QueryMerkkd_merk: TWideStringField;
    QueryMerkmerk: TWideStringField;
    DSMerk: TDataSource;
    DSBagian: TDataSource;
    QueryBagiankd_bagian: TWideStringField;
    QueryBagiannm_bagian: TWideStringField;
    QueryPeralatanno_reg: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses LoginPengurus, Peralatan, Dashboard, merek;

{$R *.dfm}

end.
