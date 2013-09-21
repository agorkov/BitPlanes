program PBitPlanes;

uses
  Vcl.Forms,
  UFMain in 'UFMain.pas' {FMain},
  UImages in 'UImages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
