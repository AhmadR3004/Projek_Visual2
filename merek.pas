unit merek;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.XPMan, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm4 = class(TForm)
    Shape1: TShape;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    Label6: TLabel;
    Label7: TLabel;
    EKd: TEdit;
    ENama: TEdit;
    Label8: TLabel;
    Button9: TButton;
    Button8: TButton;
    EFilter: TEdit;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Image2: TImage;
    Label4: TLabel;
    Shape3: TShape;
    Button1: TButton;
    Image3: TImage;
    Image4: TImage;
    Button2: TButton;
    Button3: TButton;
    Image5: TImage;
    Image6: TImage;
    Button4: TButton;
    Button5: TButton;
    Image7: TImage;
    Image8: TImage;
    Button6: TButton;
    Button7: TButton;
    Shape2: TShape;
    Shape4: TShape;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure EFilterChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EKdKeyPress(Sender: TObject; var Key: Char);
    procedure ENamaKeyPress(Sender: TObject; var Key: Char);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Dashboard, DModul, LoginPengurus, Peralatan, bagian;

procedure TForm4.Button10Click(Sender: TObject);
begin
  try
    if (
    (Trim (EKd.Text)='') and
    (Trim (ENama.Text)='')
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
        QueryMerk.Edit;
        QueryMerkkd_merk.asstring:=EKd.Text;
        QueryMerkmerk.asstring:=ENama.Text;
        QueryMerk.Post;
       end;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  form2.show;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  form4.Show;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  try
    with DataModule1 do
    begin
      if Trim(EKd.Text)='' then
        begin
          beep;
          ShowMessage('Kode Merek Belum diisi');
          EKd.SetFocus;
        end
      else
      if Trim(ENama.Text)='' then
        begin
          beep;
          ShowMessage('Nama Merek Belum diisi');
          ENama.SetFocus;
        end;

      if QueryMerk.Locate('kd_merk',EKd.Text,[]) then
      begin
        beep;
        ShowMessage('Kode Merek Sudah Ada!');
        EKd.Text:=Querymerkkd_merk.Asstring;
        ENama.Text:=Querymerkmerk.Asstring;
      end
      else
      begin
        Querymerk.Append;
        Querymerkkd_merk.Asstring:=EKd.Text;
        Querymerkmerk.Asstring:=ENama.Text;
        Querymerk.post;
      end;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
  if(
  (Trim (EKd.Text)='') and
  (Trim (ENama.Text)='')
  ) then
  begin
    beep;
    ShowMessage('Silahkah pilih data terlebih dahulu');
    DBGrid1.SetFocus;
    exit;
  end else
  datamodule1.QueryMerk.Delete;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
  with datamodule1 do
  begin
    EKd.Text:=Querymerkkd_merk.Asstring;
    ENama.Text:=Querymerkmerk.Asstring;
  end;
end;

procedure TForm4.EFilterChange(Sender: TObject);
var cari:string;
begin
  try
    cari:=QuotedStr('%'+EFilter.Text+'%');
    with DataModule1 do
    begin
      Querymerk.SQL.Clear;
      Querymerk.SQL.Text:='select*from tb_merk where kd_merk Like'+cari+'or merk Like'+cari;
      Querymerk.Open;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm4.EKdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ENama.SetFocus;
end;

procedure TForm4.ENamaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    try
      with DataModule1 do
      begin
        if Trim(EKd.Text)='' then
          begin
          beep;
          ShowMessage('Kode Merek Belum diisi');
          EKd.SetFocus;
          end
        else
        if Trim(ENama.Text)='' then
          begin
            beep;
            ShowMessage('Nama Merek Belum diisi');
            ENama.SetFocus;
          end;

        if QueryMerk.Locate('kd_merk',EKd.Text,[]) then
        begin
          beep;
          ShowMessage('Kode Merek Sudah Ada!');
          EKd.Text:=Querymerkkd_merk.Asstring;
          ENama.Text:=Querymerkmerk.Asstring;
        end
        else
        begin
          Querymerk.Append;
          Querymerkkd_merk.Asstring:=EKd.Text;
          Querymerkmerk.Asstring:=ENama.Text;
          Querymerk.post;
        end;
      end;
    except
      on salah:Exception do
      ShowMessage(salah.Message);
    end;
  end;
end;

end.
