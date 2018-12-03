unit uFrmTabsBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmBase, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl, Winapi.Windows, FMX.Platform.Win;

type
  TFrmTabsBase = class(TFrmBase)
    tcPage: TTabControl;
    TabItem1: TTabItem;
    procedure FormCreate(Sender: TObject);
  private

  protected
    procedure SetImgIndex(const Value: Integer); override;
  public
    { Public declarations }
  end;

var
  FrmTabsBase: TFrmTabsBase;

implementation

uses uComm;

{$R *.fmx}

procedure TFrmTabsBase.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFNDEF DEBUG}
  tcPage.TabPosition := TTabPosition.None;
  {$ENDIF}
end;

procedure TFrmTabsBase.SetImgIndex(const Value: Integer);
begin
  try
    inherited;
    tcPage.TabIndex := Value;
    raImage.Parent := tcPage.Tabs[tcPage.TabIndex];
    raImage.SendToBack;
  except
  end;
end;

end.
