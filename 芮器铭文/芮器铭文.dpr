program ÜÇÆ÷ÃúÎÄ;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmTouchBase in '..\Base\uFrmTouchBase.pas' {FrmTouchBase},
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrm2010000 in 'uFrm2010000.pas' {Frm2010000},
  uFrm2020000 in 'uFrm2020000.pas' {Frm2020000};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
