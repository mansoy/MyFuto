unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTabBase, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl;

type
  TFrmMain = class(TFrmTabBase)
    Rectangle1: TRectangle;
    Rectangle22: TRectangle;
    Rectangle2: TRectangle;
    Rectangle10: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Rectangle36: TRectangle;
    Rectangle37: TRectangle;
    Rectangle38: TRectangle;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure OnButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure OnButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure OnButtonMouseLeave(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uFuns;

{$R *.fmx}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  Self.ID := 1000000;
  Self.PageIndex := 0;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I].Tag >= 1000000 then
    begin

      TRectangle(Self.Components[I]).OnMouseDown := OnButtonMouseDown;
      TRectangle(Self.Components[I]).OnMouseUp := OnButtonMouseUp;
    end;
  end;
end;

procedure TFrmMain.OnButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  OnButtonMouseLeave(Sender);
end;

procedure TFrmMain.OnButtonMouseLeave(Sender: TObject);
var
  sImgName: string;
  vRectangle: TRectangle;
begin
  try
    vRectangle := TRectangle(Sender);
    if vRectangle.ComponentCount > 0 then
      vRectangle := TRectangle(Self.Components[0]);

    sImgName := Format('%sImage\%d_Pushed.png', [ExtractFilePath(ParamStr(0)), vRectangle.Tag]);
    vRectangle.Fill.Bitmap.Bitmap.LoadFromFile(sImgName);
  except on E: Exception do
    DebugInf('MS - [%s-OnRaMouseDown] fail [%s]', [Self.ClassName, E.Message]);
  end;
end;

procedure TFrmMain.OnButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  sImgName: string;
  vRectangle: TRectangle;
begin
  try
    vRectangle := TRectangle(Sender);
    if vRectangle.ComponentCount > 0 then
      vRectangle := TRectangle(Self.Components[0]);
    sImgName := Format('%sImage\%d_Normal.png', [ExtractFilePath(ParamStr(0)), vRectangle.tag]);
    vRectangle.Fill.Bitmap.Bitmap.LoadFromFile(sImgName);
  except on E: Exception do
    DebugInf('MS - [%s-OnRaMouseUp] fail [%s]', [Self.ClassName, E.Message]);
  end;
end;

end.
