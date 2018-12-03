program ½ÍËØ³Ç;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmTabBase in '..\Base\uFrmTabBase.pas' {FrmTabBase},
  uFuns in '..\Comm\uFuns.pas',
  uFrmMedia in 'uFrmMedia.pas' {FrmMedia},
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrmLastPage in 'uFrmLastPage.pas' {FrmLastPage},
  uFrm3010000 in 'uFrm3010000.pas' {Frm3010000},
  uFrmTouch01Base in 'uFrmTouch01Base.pas' {FrmTouch01Base},
  uFrm4010000 in 'uFrm4010000.pas' {Frm4010000},
  uFrm3020000 in 'uFrm3020000.pas' {Frm3020000},
  uFrm3030000 in 'uFrm3030000.pas' {Frm3030000},
  uFrm3040000 in 'uFrm3040000.pas' {Frm3040000},
  uFrm4020000 in 'uFrm4020000.pas' {Frm4020000},
  uFrm4030000 in 'uFrm4030000.pas' {Frm4030000};

{$R *.res}

begin
  Application.Initialize;
  //Application.CreateForm(TFrmMedia, FrmMedia);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
