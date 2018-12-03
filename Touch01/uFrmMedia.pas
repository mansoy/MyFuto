unit uFrmMedia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmMedia = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
    procedure PlayVideo;
  public
    { Public declarations }
  end;

var
  FrmMedia: TFrmMedia;

implementation

uses uFuns;

{$R *.dfm}

procedure TFrmMedia.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmMedia.FormShow(Sender: TObject);
begin
  PlayVideo;
end;

procedure TFrmMedia.MediaPlayer1Notify(Sender: TObject);
begin
  if  MediaPlayer1.Position = MediaPlayer1.Length  then
  begin
    Self.Close;
  end;
end;

procedure TFrmMedia.Panel1Click(Sender: TObject);
begin
  MediaPlayer1.Stop;
  Self.Close;
end;

procedure TFrmMedia.PlayVideo;
var
  sVideoFile: string;
begin
  sVideoFile := ExtractFilePath(ParamStr(0)) + 'Video.wmv';
  if not FileExists(sVideoFile) then Exit;
  try
    MediaPlayer1.FileName := sVideoFile;
    MediaPlayer1.Display := Panel1;
    MediaPlayer1.Wait := False;
    MediaPlayer1.Open;
    MediaPlayer1.DisplayRect := Panel1.ClientRect;
    MediaPlayer1.Play;
  except on E: Exception do
    DebugInf('MS - [%s-PlayVideo] fail [%s]', [Self.ClassName, E.Message]);
  end;
end;

end.
