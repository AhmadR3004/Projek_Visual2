unit bagian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.XPMan, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
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
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EFilterChange(Sender: TObject);
    procedure EKdKeyPress(Sender: TObject; var Key: Char);
    procedure ENamaKeyPress(Sender: TObject; var Key: Char);
    procedure Button10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses DModul, Dashboard, LoginPengurus, merek, Peralatan;

procedure TForm5.Button10Click(Sender: TObject);
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
        QueryBagian.Edit;
        QueryBagiankd_bagian.asstring:=EKd.Text;
        QueryBagiannm_bagian.asstring:=ENama.Text;
        QueryBagian.Post;
       end;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;


procedure TForm5.Button1Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  form3.Show;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  form4.Show;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  form5.Show;
end;

procedure TForm5.Button7Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm5.Button8Click(Sender: TObject);
begin
 try
    with DataModule1 do
    begin
      if Trim(EKd.Text)='' then
        begin
          beep;
          ShowMessage('Kode Bagian Belum diisi');
          EKd.SetFocus;
        end
      else
      if Trim(ENama.Text)='' then
        begin
          beep;
          ShowMessage('Nama Bagian Belum diisi');
          ENama.SetFocus;
        end;

      if QueryBagian.Locate('kd_bagian',EKd.Text,[]) then
      begin
        beep;
        ShowMessage('Kode Bagian Sudah Ada!');
        EKd.Text:=Querybagiankd_bagian.Asstring;
        ENama.Text:=Querybagiannm_bagian.Asstring;
      end
      else
      begin
        Querybagian.Append;
        Querybagiankd_bagian.Asstring:=EKd.Text;
        Querybagiannm_bagian.Asstring:=ENama.Text;
        Querybagian.post;
      end;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm5.Button9Click(Sender: TObject);
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
  datamodule1.Querybagian.Delete;
end;

procedure TForm5.DBGrid1DblClick(Sender: TObject);
begin
  with datamodule1 do
  begin
    EKd.Text:=Querybagiankd_bagian.Asstring;
    ENama.Text:=Querybagiannm_bagian.Asstring;
  end;
end;

procedure TForm5.EFilterChange(Sender: TObject);
var cari:string;
begin
  try
    cari:=QuotedStr('%'+EFilter.Text+'%');
    with DataModule1 do
    begin
      Querybagian.SQL.Clear;
      Querybagian.SQL.Text:='select*from tb_bagian where kd_bagian Like'+cari+'or nm_bagian Like'+cari;
      Querybagian.Open;
    end;
  except
    on salah:Exception do
    ShowMessage(salah.Message);
  end;
end;

procedure TForm5.EKdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ENama.SetFocus;
end;

procedure TForm5.ENamaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    try
    with DataModule1 do
      begin
      if Trim(EKd.Text)='' then
        begin
          beep;
          ShowMessage('Kode Bagian Belum diisi');
          EKd.SetFocus;
        end
      else
      if Trim(ENama.Text)='' then
        begin
          beep;
          ShowMessage('Nama Bagian Belum diisi');
          ENama.SetFocus;
        end;

        if QueryBagian.Locate('kd_bagian',EKd.Text,[]) then
        begin
          beep;
          ShowMessage('Kode Bagian Sudah Ada!');
          EKd.Text:=Querybagiankd_bagian.Asstring;
          ENama.Text:=Querybagiannm_bagian.Asstring;
        end
        else
        begin
          Querybagian.Append;
          Querybagiankd_bagian.Asstring:=EKd.Text;
          Querybagiannm_bagian.Asstring:=ENama.Text;
          Querybagian.post;
        end;
      end;
    except
      on salah:Exception do
      ShowMessage(salah.Message);
    end;
  end;
end;

end.
