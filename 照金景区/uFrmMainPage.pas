unit uFrmMainPage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts;

type
  TFrmMainPage = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Layout2: TLayout;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Layout3: TLayout;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Layout4: TLayout;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Layout5: TLayout;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    Layout6: TLayout;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Rectangle36: TRectangle;
    Rectangle37: TRectangle;
    Layout7: TLayout;
    Rectangle38: TRectangle;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure OpenSecondaryForm(Sender: TObject); //打开二级窗口
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmMainPage: TFrmMainPage;

implementation

uses uFrmTest, uFuns, uPageParse;

{$R *.fmx}

procedure TFrmMainPage.FormCreate(Sender: TObject);
var
  I, J: Integer;
  vLayout: TLayout;
  vRectangle: TRectangle;
begin
	//--加载配置
  uPageParse.LoadConfig();
  {$IFNDEF DEBUG}
  for I := 0 to Self.Rectangle1.ControlsCount - 1 do
  begin
    if not (Self.Rectangle1.Controls[I] is TLayout) then Continue;
    vLayout := TLayout(Self.Rectangle1.Controls[I]);
    if vLayout = nil then Continue;
    for J := 0 to vLayout.ControlsCount - 1 do
    begin
      if not (vLayout.Controls[J] is TRectangle) then Continue;
      vRectangle := TRectangle(vLayout.Controls[J]);
      if vRectangle = nil then Continue;
      vRectangle.Stroke.Kind := TBrushKind.None;
    end;
  end;

  {$ENDIF}
  //Rectangle2.Width := 300;
  //Rectangle2.Height := 300;
  //Rectangle2.Stroke.Kind := TBrushKind.bkNone;
  //Rectangle2.Fill.Kind := TBrushKind.bkBitmap;
  //Rectangle2.Fill.Bitmap.WrapMode := TWrapMode.wmTile;
  //Rectangle2.Fill.Bitmap.WrapMode := TWrapMode.wmTileOriginal;
  //Rectangle2.Fill.Bitmap.WrapMode := TWrapMode.wmTileStretch;
	//Rectangle2.Fill.Bitmap.Bitmap.LoadFromFile('myfile.jpg');
end;

procedure TFrmMainPage.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmMainPage.OpenSecondaryForm(Sender: TObject);
begin
  uFuns.CreateForm(Self, 'TFrmSecondaryPages', TRectangle(Sender).Tag);
end;

end.
