program ÜÇÊÏ×Ú´Ê;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmBase in '..\Base\uFrmBase.pas' {FrmBase},
  uComm in '..\Comm\uComm.pas',
  uFrmSingleBase in '..\Base\uFrmSingleBase.pas' {FrmSingleBase},
  uFrmTabsBase in '..\Base\uFrmTabsBase.pas' {FrmTabsBase},
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrm2000000 in 'uFrm2000000.pas' {Frm2000000};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
