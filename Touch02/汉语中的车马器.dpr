program 汉语中的车马器;

uses
  System.StartUpCopy,
  FMX.Forms,
  ManSoy.MsgBox in '..\Comm\ManSoy.MsgBox.pas',
  uCfg in 'uCfg.pas',
  uFrmTabBase in '..\Base\uFrmTabBase.pas' {FrmTabBase},
  uFuns in '..\Comm\uFuns.pas',
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrm2000000 in 'uFrm2000000.pas' {Frm2000000};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
