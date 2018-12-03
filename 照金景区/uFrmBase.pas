unit uFrmBase;

interface

uses
  Winapi.Windows, FMX.Platform.Win, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Ani, FMX.TabControl, uGlobal,
  System.Actions, FMX.ActnList;

type
  TFrmBase = class(TForm)
    tcPage: TTabControl;
    ActionList1: TActionList;
    actMainPage: TAction;
    actPriorPage: TAction;
    actNextPage: TAction;
    ActOpenNextPage: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure actPriorPageExecute(Sender: TObject);
    procedure actMainPageExecute(Sender: TObject);
    procedure actNextPageExecute(Sender: TObject);
    procedure ActOpenNextPageExecute(Sender: TObject);
  private
    { Private declarations }
    FimgBackGround: string;
    FPageIndex: Integer;
    FPageLevel: TPageLevel;
    FNextPageClassName: string;      //下一级窗口类名
    procedure InitFloatAnimate;
    function GetPageIndex: Integer;
    procedure SetPageIndex(const Value: Integer); //查找此
    procedure NavigatePage(APageIndex: Integer); virtual;
    function GetPageLevel: TPageLevel;
    procedure SetPageLevel(const Value: TPageLevel);
    procedure InitEvent();
  protected
    procedure GoPriorPage; virtual;
    procedure GoNextPage; virtual;
    procedure GoMainPage; virtual;
  public
    { Public declarations }
    property PageIndex: Integer read GetPageIndex write SetPageIndex;
    property PageLevel: TPageLevel read GetPageLevel write SetPageLevel default plTwo;
  end;

var
  FrmBase: TFrmBase;

implementation

uses uFuns;

{$R *.fmx}

procedure TFrmBase.actMainPageExecute(Sender: TObject);
begin
	GoMainPage;
end;

procedure TFrmBase.actNextPageExecute(Sender: TObject);
begin
	GoNextPage;
end;

procedure TFrmBase.ActOpenNextPageExecute(Sender: TObject);
var
  iPageIndex: Integer;
begin
	//
  iPageIndex := TShape(Sender).Tag;
  if iPageIndex < 10000 then Exit;

  case FPageLevel of
    plOne: ;
    plTwo:
    	//uFuns.CreateForm(Self, 'TfrmLastPage', iPageIndex);
    	begin
        if (iPageIndex div 10000) in [3, 4] then
        begin
        	uFuns.CreateForm(Self, Format('Tfrm%d', [10000 * (iPageIndex div 10000)]), iPageIndex);
        end else
        begin
          uFuns.CreateForm(Self, 'TfrmLastPage', iPageIndex);
        end;
      end;
    plThree: uFuns.CreateForm(Self, 'TfrmLastPage', iPageIndex);
	end;
  //ShowMessage(Format('%s_%d', [TShape(Sender).Name, iPageIndex]));
end;

procedure TFrmBase.actPriorPageExecute(Sender: TObject);
begin
  GoPriorPage;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
  {$IFNDEF DEBUG}
  tcPage.TabPosition := TTabPosition.None;
  {$ENDIF}
  InitEvent;
  InitFloatAnimate;
end;

procedure TFrmBase.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
	//{$IFDEF DEBUG}
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
  //{$ENDIF}
end;

function TFrmBase.GetPageIndex: Integer;
begin
  Result := FPageIndex;
end;

function TFrmBase.GetPageLevel: TPageLevel;
begin
  Result := FPageLevel;
end;

procedure TFrmBase.GoMainPage;
begin
  case FPageLevel of
    plOne: ;
    plTwo:
    	begin
      	Self.Close;
      end;
    plThree:
    	begin
      	Self.Close;
      	uFuns.ClosePage('TFrmSecondaryPages');
      end;
  end;
end;

procedure TFrmBase.GoNextPage;
begin
  if tcPage.TabIndex >= tcPage.TabCount - 1 then
  begin
    Self.Close;
    Exit;
  end;
  tcPage.TabIndex := tcPage.TabIndex + 1;
	case FPageLevel of
    plOne: ;
    plTwo:
    	begin
        Self.PageIndex := (tcPage.TabIndex + 1) * 10000;
      end;
    plThree:
    	begin
        Self.PageIndex := ((Self.PageIndex div 100) + 1) * 100;
      end;
  end;
end;

procedure TFrmBase.GoPriorPage;
begin
  if tcPage.TabIndex <= 0 then
  begin
    Self.Close;
    Exit;
  end;
  tcPage.TabIndex := tcPage.TabIndex - 1;
	case FPageLevel of
    plOne: ;
    plTwo:
    	begin
        Self.PageIndex := (tcPage.TabIndex + 1) * 10000;
      end;
    plThree:
    	begin
        Self.PageIndex := ((PageIndex div 100) -1) * 100;
      end;
  end;
end;

procedure TFrmBase.InitEvent;
var
	I: Integer;
begin
	//
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TRectangle) or (Self.Components[I] is TRoundRect) then
    begin
    	{$IFNDEF DEBUG}
      TShape(Self.Components[I]).Stroke.Kind := TBrushKind.None;
      {$ENDIF}

      if Self.Components[i].Name = 'rectPriorPage' then
        TRectangle(Self.Components[I]).OnClick := actPriorPageExecute;

      if Self.Components[i].Name = 'rectNextPage' then
        TRectangle(Self.Components[I]).OnClick := actNextPageExecute;

      if Self.Components[i].Name = 'rectMainPage' then
        TRectangle(Self.Components[I]).OnClick := actMainPageExecute;

      if Self.Components[I].Tag >= 10000 then
      begin
        TShape(Self.Components[I]).OnClick := ActOpenNextPageExecute;
      end;

    end;
  	OutputDebugString(PWideChar(Format('MS - %s', [Self.Components[I].Name])));
  end;
end;

procedure TFrmBase.InitFloatAnimate;
var
	vInterpolationType: TInterpolationType;
  iIndex, iStartValue: Integer;
begin
	Randomize;
	iIndex := Random(10);
  vInterpolationType := TInterpolationType(iIndex);
//  faBackground.Enabled := True;
//  faBackground.Loop := False;
//  faBackground.Interpolation := vInterpolationType;
//  faBackground.Duration := 1.0;  //一个动画周期的长度(秒)
//  iStartValue := Random(360);
//  if iStartValue > 320 then iStartValue := iStartValue - 50;
//  faBackground.StartValue := Random(360);  //起点角度
//  faBackground.StopValue := 360; //终点角度
end;

procedure TFrmBase.NavigatePage(APageIndex: Integer);
begin
  case FPageLevel of
    plOne:;
    plTwo: tcPage.TabIndex := (APageIndex div 10000) - 1;
    plThree: tcPage.TabIndex := ((APageIndex div 100) mod 100) - 1;
  end;
end;

procedure TFrmBase.SetPageIndex(const Value: Integer);
begin
  FPageIndex := Value;
  NavigatePage(FPageIndex);
end;

procedure TFrmBase.SetPageLevel(const Value: TPageLevel);
begin
  FPageLevel := Value;
end;

end.
