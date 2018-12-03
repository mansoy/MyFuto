unit uFrm2000000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTabBase, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl;

type
  TFrm2000000 = class(TFrmTabBase)
    Rectangle4: TRectangle;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    raPlayVideo: TRectangle;
    raGoBack: TRectangle;
    procedure raPlayVideoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2000000: TFrm2000000;

implementation

uses uFrmMedia;

{$R *.fmx}

procedure TFrm2000000.FormCreate(Sender: TObject);
begin
  Self.ID := 1000000;
  Self.PageIndex := 0;
  inherited;
end;

procedure TFrm2000000.raPlayVideoClick(Sender: TObject);
var
  F: TFrmMedia;
begin
  inherited;
  F := TFrmMedia.Create(nil);
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;
end;

initialization
  RegisterClass(TFrm2000000);

finalization
  UnRegisterClass(TFrm2000000);

end.
