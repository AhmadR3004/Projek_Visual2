unit LoginPengurus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.XPMan;

type
  TForm1 = class(TForm)
    Epengurus: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Epassword: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Button1: TButton;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure EpasswordKeyPress(Sender: TObject; var Key: Char);
    procedure EpengurusKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DModul, Dashboard;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if DataModule1.QueryPengurus.Locate('nm_pengurus',EPengurus.Text,[]) then
    begin
      // mengecek lagi password saat username sesuai tabel/benar
      if DataModule1.QueryPengurus.Locate('password',EPassword.Text,[]) then
        begin
          //posisi password benar
          Form2.show;
          Form1.Hide;
          MessageBox(Handle,'SELAMAT DATANG','INFO',MB_ICONINFORMATION);
          EPengurus.Clear;
          EPassword.Clear;
        end else

        begin
          //password salah tapi posisi username benar
          ShowMessage('Password Anda salah');
          Exit;
        end;
    end else

    begin
      // bila user tidak ada di tabel saat diketikan
      ShowMessage('Username atau Password salah');
      Exit;
    end;
end;

procedure TForm1.EpasswordKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
    if DataModule1.QueryPengurus.Locate('nm_pengurus',EPengurus.Text,[]) then
    begin
      // mengecek lagi password saat username sesuai tabel/benar
      if DataModule1.QueryPengurus.Locate('password',EPassword.Text,[]) then
        begin
          //posisi password benar
          Form2.show;
          Form1.Hide;
          MessageBox(Handle,'SELAMAT DATANG','INFO',MB_ICONINFORMATION);
          EPengurus.Clear;
          EPassword.Clear;
        end else

        begin
          //password salah tapi posisi username benar
          ShowMessage('Password Anda salah');
          Exit;
        end;
    end else

    begin
      // bila user tidak ada di tabel saat diketikan
      ShowMessage('Username atau Password salah');
      Exit;
    end;
   end;
end;

procedure TForm1.EpengurusKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Epassword.SetFocus;
end;

end.
