unit uPageParse;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, SuperObject;

type
	TPageItem = class
  private
    FID: Integer;
    FDesc: string;
  public
    property ID: Integer read FID write FID;
    property Desc: string read FDesc write FDesc;
  end;

  TAppConfig = class
  private
    FLastPages: TArray<TPageItem>;
  public
  	property LastPages: TArray<TPageItem> read FLastPages write FLastPages;
  end;

  TSerizalizes = class
  public
    class function AsJSON<T>(AObject: T; Indent: Boolean = False): string;
    class function AsType<T>(AJsonText: string; var tRet: T): Boolean;
  end;

  procedure LoadConfig();

implementation

uses uGlobal;

{ TSerizalizes }

class function TSerizalizes.AsJSON<T>(AObject: T; Indent: Boolean): string;
var
  Ctx: TSuperRttiContext;
begin
  Ctx := TSuperRttiContext.Create;
  try
    try
      Result := Ctx.AsJson<T>(AObject).AsJSon(Indent, False);
    except
      on E: Exception do
        OutputDebugString(PWideChar(Format('MS - AsJson fail, Err: %s', [E.Message])));
    end;
  finally
    Ctx.Free;
  end;
end;

class function TSerizalizes.AsType<T>(AJsonText: string; var tRet: T): Boolean;
var
  Ctx: TSuperRttiContext;
begin
  Result := False;
  Ctx := TSuperRttiContext.Create;
  try
    try
      tRet := Ctx.AsType<T>(SO(AJsonText));
      Result := True;
    except
      on E: Exception do
      begin
        OutputDebugString(PWideChar(Format('MS - AsType fail, Err: %s', [E.Message])));
      end;
    end;
  finally
    Ctx.Free;
  end;
end;

procedure LoadConfig();
var
	vLst: TStrings;
begin
	if not FileExists(uGlobal.GConfigFile) then
  begin
		OutputDebugString('MS - 配置不存在');
    Exit;
  end;
  vLst := TStringList.Create;
  try
    vLst.LoadFromFile(uGlobal.GConfigFile);
    if vLst.Count <= 0 then
    begin
    	OutputDebugString('MS - 配置内容为空');
    	Exit;
    end;
  	if not TSerizalizes.AsType<TAppConfig>(vLst.Text, GAppConfig) then
    begin
    	OutputDebugString('MS - 序列化配置内容出错');
    	Exit;
    end;
  finally
    FreeAndNil(vLst);
  end;
end;

initialization
	LoadConfig();

end.
