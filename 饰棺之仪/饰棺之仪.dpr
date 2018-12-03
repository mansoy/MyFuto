program ÊÎ¹×Ö®ÒÇ;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmTouchBase in '..\Base\uFrmTouchBase.pas' {FrmTouchBase},
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrm2010000 in 'uFrm2010000.pas' {Frm2010000},
  uFrm2020000 in 'uFrm2020000.pas' {Frm2020000},
  uFrm2030000 in 'uFrm2030000.pas' {Frm2030000},
  uFrm2040000 in 'uFrm2040000.pas' {Frm2040000},
  uFrm2050000 in 'uFrm2050000.pas' {Frm2050000},
  uFrm2060000 in 'uFrm2060000.pas' {Frm2060000},
  uFrmBase in '..\Base\uFrmBase.pas' {FrmBase},
  uComm in '..\Comm\uComm.pas',
  uFrmMainBase in '..\Base\uFrmMainBase.pas' {FrmMainBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmBase, FrmBase);
  Application.CreateForm(TFrmMainBase, FrmMainBase);
  Application.Run;
end.
