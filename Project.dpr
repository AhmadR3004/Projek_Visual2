program Project;

uses
  Vcl.Forms,
  LoginPengurus in 'LoginPengurus.pas' {Form1},
  DModul in 'DModul.pas' {DataModule1: TDataModule},
  Dashboard in 'Dashboard.pas' {Form2},
  Peralatan in 'Peralatan.pas' {Form3},
  merek in 'merek.pas' {Form4},
  bagian in 'bagian.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
