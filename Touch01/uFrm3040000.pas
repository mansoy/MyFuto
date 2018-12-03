unit uFrm3040000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm3040000 = class(TFrmTouch01Base)
    actOpenURL: TAction;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    procedure actOpenURLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm3040000: TFrm3040000;

implementation

uses Winapi.Windows, Winapi.ShellAPI{, uFrmWebBrowser};

{$R *.fmx}

procedure TFrm3040000.actOpenURLExecute(Sender: TObject);
var
  sURL: string;
begin
  inherited;
  sURL := '';
  case TAction(Sender).Tag of
    101: sURL := 'http://www.jiaosucity.com/';
    102: sURL := 'http://www.wszgjsc.com/index.php';
    103: sURL := 'https://m.weibo.cn/u/6323969560';
    //104: sURL := 'http://www.jiaosucity.com/';
  end;
  if sURL = '' then Exit;
  
  ShellExecute(0, nil, PWideChar(sURL), nil, nil, SW_MAXIMIZE);
  //OpenURL(sURL, Self);
end;

initialization
  System.Classes.RegisterClass(TFrm3040000);

finalization
  System.Classes.UnRegisterClass(TFrm3040000);
end.
