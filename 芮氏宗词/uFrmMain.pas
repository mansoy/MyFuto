unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTabsBase, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.Objects;

type
  TFrmMain = class(TFrmTabsBase)
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    Rectangle2: TRectangle;
    Rectangle1: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle3: TRectangle;
    Rectangle8: TRectangle;
    Rectangle7: TRectangle;
    ActGoPage: TAction;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure ActGoPageExecute(Sender: TObject);
  private
    { Private declarations }
    procedure InitEventEx;
    procedure OnImgMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure OnImgMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uComm;

{$R *.fmx}

procedure TFrmMain.ActGoPageExecute(Sender: TObject);
begin
  inherited;
  ImgIndex := TAction(Sender).Tag;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Self.ID := 1000000;
  inherited;
  Self.ImgIndex := 0;
  InitEventEx;
end;

procedure TFrmMain.InitEventEx;
var
	I: Integer;
begin
	//
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TRectangle) or (Self.Components[I] is TRoundRect) then
    begin

      //打开一个新页面
      if Self.Components[I].Tag < 100 then
      begin
        TShape(Self.Components[I]).OnClick := ActGoPageExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;
    end;

    if ((Self.Components[I] is TRectangle) or (Self.Components[I] is TRoundRect)) and (Self.Components[I].Tag > 1000000) then
    begin
      TShape(Self.Components[I]).OnMouseDown := OnImgMouseDown;
      TShape(Self.Components[I]).OnMouseUp := OnImgMouseUp;
    end;
  	DebugInf('MS - %s', [Self.Components[I].Name]);
  end;
end;

procedure TFrmMain.OnImgMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
//var
  //sName: string;
begin
  //TImage(Sender).Bitmap.Assign(TImage(Sender).MultiResBitmap.Bitmaps[2]);
  //sName := TShape(Sender).Name;
  TShape(Sender).Position.X := TShape(Sender).Position.X + 3;
  TShape(Sender).Position.Y := TShape(Sender).Position.Y + 3;
end;

procedure TFrmMain.OnImgMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  //TImage(Sender).Bitmap.Assign(TImage(Sender).MultiResBitmap.Bitmaps[1]);
  TShape(Sender).Position.X := TShape(Sender).Position.X - 3;
  TShape(Sender).Position.Y := TShape(Sender).Position.Y - 3;
end;

end.
