unit Peralatan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.XPMan, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Shape3: TShape;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Image2: TImage;
    Label4: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Shape1: TShape;
    Label6: TLabel;
    Shape4: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ENama: TEdit;
    ENmr: TEdit;
    EUk: TEdit;
    EKat: TEdit;
    EMasM: TEdit;
    EThn: TEdit;
    XPManifest1: TXPManifest;
    CBBgn: TComboBox;
    EHrg: TEdit;
    DTTgl: TDateTimePicker;
    DBGrid1: TDBGrid;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CBMerek: TComboBox;
    EFilter: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    EKd: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EFilterChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Dashboard, DModul, LoginPengurus, merek, bagian;

procedure TForm3.Button10Click(Sender: TObject);
begin
  EKd.Clear;
  ENama.Clear;
  ENmr.Clear;
  CBMerek.Clear;
  EUk.Clear;
  EKat.Clear;
  EMasM.Clear;
  EThn.Clear;
  CBBgn.Clear;
  EHrg.Clear;
  DTTgl.Date:=Now;
end;

procedure TForm3.Button11Click(Sender: TObject);
begin
  with DataModule1 do
  begin
    CBMerek.Items.Clear;
    Querymerk.Close;
    Querymerk.Open;
    while not Querymerk.Eof do
  begin
    CBMerek.Items.Add(Querymerk.FieldByName('merk').AsString);
    Querymerk.Next;
  end
  end;

with DataModule1 do
  begin
    CBBgn.Items.Clear;
    QueryBagian.Close;
    QueryBagian.Open;
    while not QueryBagian.Eof do
  begin
    CBBgn.Items.Add(QueryBagian.FieldByName('nm_bagian').AsString);
    QueryBagian.Next;
  end
  end;
end;

procedure TForm3.Button13Click(Sender: TObject);
begin
  try
    if(
      (Trim (EKd.Text)='') and
      (Trim (ENama.Text)='') and
      (Trim (ENmr.Text)='') and
      (Trim (CBMerek.Text)='') and
      (Trim (EUk.Text)='') and
      (Trim (EKat.Text)='') and
      (Trim (EMasM.Text)='') and
      (Trim (EThn.Text)='') and
      (Trim (CBBgn.Text)='') and
      (Trim (EHrg.Text)='')
      ) then
    begin
      beep;
      ShowMessage('Silahkah pilih data terlebih dahulu');
      DBGrid1.SetFocus;
      exit;
    end else

    begin
      with DataModule1 do
       begin
        QueryPeralatan.Edit;
        QueryPeralatankd_brg.Asstring:=EKd.Text;
        QueryPeralatannm_brg.Asstring:=ENama.Text;
        QueryPeralatanno_reg.Asstring:=ENmr.Text;
        QueryPeralatankd_merk.Asstring:=CBMerek.Text;
        QueryPeralatanukuran.Asstring:=EUk.Text;
        QueryPeralatanno_prmbp.Asstring:=EKat.Text;
        QueryPeralatanm_manfaat.Asstring:=EMasM.Text;
        QueryPeralatanth_pembelian.Asstring:=EThn.Text;
        QueryPeralatankd_bag.Asstring:=CBBgn.Text;
        QueryPeralatanhrg_perolehan.Asstring:=EHrg.Text;
        QueryPeralatantgl_input.AsDateTime:=DTTgl.Date;
        QueryPeralatan.post;
       end;
    end;
    except
    on salah:Exception do
    ShowMessage(Salah.Message);
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  form4.show;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  try
    with DataModule1 do
    begin
      if Trim(EKd.Text)='' then
        begin
          beep;
          ShowMessage('Kode barang Belum diisi');
          EKd.SetFocus;
        end
      else
      if Trim(ENama.Text)='' then
        begin
          beep;
          ShowMessage('Nama Belum diisi');
          ENama.SetFocus;
        end
      else
      if Trim(ENmr.Text)='' then
        begin
          beep;
          ShowMessage('Nomer Belum diisi');
          ENmr.SetFocus;
        end
      else
      if Trim(CBMerek.Text)='' then
        begin
          beep;
          ShowMessage('Merek Belum diisi');
          CBMerek.SetFocus;
        end
      else
      if Trim(EUk.Text)='' then
        begin
          beep;
          ShowMessage('Ukuran Belum diisi');
          EUk.SetFocus;
        end
      else
      if Trim(EKat.Text)='' then
        begin
          beep;
          ShowMessage('Kategori Belum diisi');
          EKat.SetFocus;
        end
      else
      if Trim(EMasM.Text)='' then
        begin
          beep;
          ShowMessage('Masa Manfaat Belum diisi');
          EMasM.SetFocus;
        end
      else
      if Trim(EThn.Text)='' then
        begin
          beep;
          ShowMessage('Tahun Belum diisi');
          EThn.SetFocus;
        end
      else
      if Trim(CBBgn.Text)='' then
        begin
          beep;
          ShowMessage('Bagian Belum diisi');
          CBBgn.SetFocus;
        end
      else
      if Trim(EHrg.Text)='' then
        begin
          beep;
          ShowMessage('Harga Belum diisi');
          EHrg.SetFocus;
        end;

      if QueryPeralatan.Locate('nm_brg',ENama.Text,[]) then
      begin
        beep;
        ShowMessage('Nama Barang Sudah Ada!');
        EKd.Text:=QueryPeralatankd_brg.Asstring;
        ENama.Text:=QueryPeralatannm_brg.Asstring;
        ENmr.Text:=QueryPeralatanno_reg.Asstring;
        CBMerek.Text:=QueryPeralatankd_merk.Asstring;
        EUk.Text:=QueryPeralatanukuran.Asstring;
        EKat.Text:=QueryPeralatanno_prmbp.Asstring;
        EMasM.Text:=QueryPeralatanm_manfaat.Asstring;
        EThn.Text:=QueryPeralatanth_pembelian.Asstring;
        CBBgn.Text:=QueryPeralatankd_bag.Asstring;
        EHrg.Text:=QueryPeralatanhrg_perolehan.Asstring;
        DTTgl.Date:=QueryPeralatantgl_input.AsDateTime;
      end
      else
      begin
        QueryPeralatan.Append;
        QueryPeralatankd_brg.Asstring:=EKd.Text;
        QueryPeralatannm_brg.Asstring:=ENama.Text;
        QueryPeralatanno_reg.Asstring:=ENmr.Text;
        QueryPeralatankd_merk.Asstring:=CBMerek.Text;
        QueryPeralatanukuran.Asstring:=EUk.Text;
        QueryPeralatanno_prmbp.Asstring:=EKat.Text;
        QueryPeralatanm_manfaat.Asstring:=EMasM.Text;
        QueryPeralatanth_pembelian.Asstring:=EThn.Text;
        QueryPeralatankd_bag.Asstring:=CBBgn.Text;
        QueryPeralatanhrg_perolehan.Asstring:=EHrg.Text;
        QueryPeralatantgl_input.AsDateTime:=DTTgl.Date;
        QueryPeralatan.post;
      end;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm3.Button9Click(Sender: TObject);
begin
  if(
  (Trim (EKd.Text)='') and
  (Trim (ENama.Text)='') and
  (Trim (ENmr.Text)='') and
  (Trim (CBMerek.Text)='') and
  (Trim (EUk.Text)='') and
  (Trim (EKat.Text)='') and
  (Trim (EMasM.Text)='') and
  (Trim (EThn.Text)='') and
  (Trim (CBBgn.Text)='') and
  (Trim (EHrg.Text)='')
  ) then
  begin
    beep;
    ShowMessage('Silahkah pilih data terlebih dahulu');
    DBGrid1.SetFocus;
    exit;
  end else
  datamodule1.QueryPeralatan.Delete;
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
begin
  with datamodule1 do
  begin
    EKd.Text:=QueryPeralatankd_brg.Asstring;
    ENama.Text:=QueryPeralatannm_brg.Asstring;
    ENmr.Text:=QueryPeralatanno_reg.Asstring;
    CBMerek.Text:=QueryPeralatankd_merk.Asstring;
    EUk.Text:=QueryPeralatanukuran.Asstring;
    EKat.Text:=QueryPeralatanno_prmbp.Asstring;
    EMasM.Text:=QueryPeralatanm_manfaat.Asstring;
    EThn.Text:=QueryPeralatanth_pembelian.Asstring;
    CBBgn.Text:=QueryPeralatankd_bag.Asstring;
    EHrg.Text:=QueryPeralatanhrg_perolehan.Asstring;
    DTTgl.Date:=QueryPeralatantgl_input.AsDateTime;
  end;
end;

procedure TForm3.EFilterChange(Sender: TObject);
var cari:string;
begin
  try
    cari:=QuotedStr('%'+EFilter.Text+'%');
    with DataModule1 do
    begin
      QueryPeralatan.SQL.Clear;
      QueryPeralatan.SQL.Text:='select*from tb_peralatan where kd_brg Like'+cari+'or nm_brg Like'+cari+'or no_reg Like'+cari+'or kd_merk Like'+cari+'or ukuran Like'+cari+'or no_prmbp Like'+cari+'or m_manfaat Like'+cari+'or th_pembelian Like'+cari+'or kd_bag Like'+cari+'or hrg_perolehan Like'+cari+'or tgl_input Like'+cari;
      QueryPeralatan.Open;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  with DataModule1 do
  begin
    CBMerek.Items.Clear;
    Querymerk.Close;
    Querymerk.Open;
    while not Querymerk.Eof do
  begin
    CBMerek.Items.Add(Querymerk.FieldByName('merk').AsString);
    Querymerk.Next;
  end
  end;

with DataModule1 do
  begin
    CBBgn.Items.Clear;
    QueryBagian.Close;
    QueryBagian.Open;
    while not QueryBagian.Eof do
  begin
    CBBgn.Items.Add(QueryBagian.FieldByName('nm_bagian').AsString);
    QueryBagian.Next;
  end
  end;
end;

end.
