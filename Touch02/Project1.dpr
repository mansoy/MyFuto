program Project1;

uses
  Vcl.Forms,
  uCfg in 'uCfg.pas',
  uFrm3000000 in 'uFrm3000000.pas' {Frm3000000},
  ManSoy.MsgBox in '..\Comm\ManSoy.MsgBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm3000000, Frm3000000);
  Application.Run;
end.
