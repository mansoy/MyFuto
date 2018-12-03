unit uFrmLastPage;

interface

uses
  Winapi.Windows, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmBase, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.Objects;

type
  TFrmLastPage = class(TFrmBase)
    tiPage: TTabItem;
    rectPage: TRectangle;
    rectMainPage: TRectangle;
    rectNextPage: TRectangle;
    rectPriorPage: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FImgFile: string;
    { Private declarations }
    procedure LoadImage();
  protected
  	procedure GoPriorPage; override;
    procedure GoNextPage; override;
  public
    { Public declarations }
    property ImgFile: string read FImgFile write FImgFile;
  end;

var
  FrmLastPage: TFrmLastPage;

implementation

uses uGlobal, uPageParse, FMX.Platform.Win;

{$R *.fmx}

procedure TFrmLastPage.FormCreate(Sender: TObject);
begin
  PageLevel := plThree;
  inherited;
end;

procedure TFrmLastPage.FormShow(Sender: TObject);
begin
  inherited;
	//--加載圖片
  LoadImage();
end;

procedure TFrmLastPage.GoNextPage;
var
	iPageIndex: Integer;
  vPageItem: TPageItem;
begin
	iPageIndex := -1;
  for vPageItem in GAppConfig.LastPages do
  begin
    if (PageIndex + 1) = vPageItem.ID then
    begin
      iPageIndex := vPageItem.ID;
      Break;
    end;
  end;

  if iPageIndex = -1 then
  begin
  	Close;
  	Exit;
  end;

  Self.PageIndex := iPageIndex;
  LoadImage();
end;

procedure TFrmLastPage.GoPriorPage;
var
	iPageIndex: Integer;
  vPageItem: TPageItem;
begin
	iPageIndex := -1;
  for vPageItem in GAppConfig.LastPages do
  begin
    if (PageIndex - 1) = vPageItem.ID then
    begin
      iPageIndex := vPageItem.ID;
      Break;
    end;
  end;

  if iPageIndex = -1 then
  begin
  	Close;
  	Exit;
  end;

  Self.PageIndex := iPageIndex;
  LoadImage();
end;

procedure TFrmLastPage.LoadImage();
var
	sImgFile: string;
begin
  tcPage.TabIndex := 0;    //这句话必须加，因为基类里边设置了TabIndex
  sImgFile := Format('%s%d.jpg', [uGlobal.GLastPageImgPath, PageIndex]);
  if not FileExists(sImgFile) then
  begin
    MessageBox(FormToHWND(Self), '缺少图片！', '提示', MB_ICONWARNING);
    Exit;
  end;
  rectPage.Fill.Bitmap.Bitmap.LoadFromFile(sImgFile);
end;

initialization
	RegisterClass(TFrmLastPage);

finalization
	UnRegisterClass(TFrmLastPage);

end.
