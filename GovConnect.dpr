program GovConnect;

uses
  Vcl.Forms,
  FV_Login in 'View\FV_Login.pas' {Form1},
  FV_Gestor in 'View\FV_Gestor.pas' {Form2},
  FV_Cidadao in 'View\FV_Cidadao.pas' {Form3},
  UM_Cidadao in 'Model\UM_Cidadao.pas',
  UM_Gestor in 'Model\UM_Gestor.pas',
  UM_Login in 'Model\UM_Login.pas',
  UC_Cidadao in 'Controller\UC_Cidadao.pas',
  UC_Gestor in 'Controller\UC_Gestor.pas',
  UC_Login in 'Controller\UC_Login.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
