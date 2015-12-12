unit UnitMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, 
  Vcl.ExtCtrls, Vcl.StdCtrls, JvComponentBase, JvSearchFiles, UnitFileCompare, 
  UnitFileCopyPair, UnitProjectFile, Vcl.Mask, JvExMask, JvToolEdit, IdBaseComponent, 
  IdThreadComponent, CommCtrl, System.Win.TaskbarCore, Vcl.Taskbar, JvExComCtrls, 
  JvComCtrls, Generics.Collections, Vcl.Menus, ShellAPI, UnitFolderCreatePair, 
  IdMessage, IdComponent, IdTCPConnection, IdTCPClient, 
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, JvThreadTimer, acProgressBar, 
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IniFiles, 
  System.ImageList, Vcl.ImgList, Vcl.Buttons, JvComputerInfoEx, IOUtils,
  JvCaptionButton, JvTrayIcon, UnitLogItems, IdAttachmentFile, IdAttachment,
  JvFormPlacement, JvAppStorage, JvAppIniStorage;

type
  TMainForm = class(TForm)
    JobsList: TListView;
    SearchSourceFiles: TJvSearchFiles;
    ToolBar: TPanel;
    StateLabel: TLabel;
    RunJobsBtn: TButton;
    ProjectNameLabel: TLabel;
    AddNewProjectBtn: TButton;
    StopBtn: TButton;
    EditProjectBtn: TButton;
    OperationThread: TIdThreadComponent;
    SearchDestFiles: TJvSearchFiles;
    LogsPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Taskbar1: TTaskbar;
    TabSheet3: TTabSheet;
    LogList: TListView;
    ErrorLog: TListView;
    FullLogList: TListView;
    JobListMenu: TPopupMenu;
    O1: TMenuItem;
    O2: TMenuItem;
    ActivatePanel: TPanel;
    SelectAllLabel: TLabel;
    SelectNoneLabel: TLabel;
    SelectReverseLabel: TLabel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    ChangesLabel: TLabel;
    SpeedLabel: TLabel;
    SpeedTimer: TJvThreadTimer;
    TimeLabel: TLabel;
    PassedTimeTimer: TJvThreadTimer;
                                   
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    ConfEmailBtn: TButton;
    ProgressTimer: TTimer;
    DeleteBtn: TButton;
    PreviewBtn: TButton;
    ProgressBar: TsProgressBar;
    PercentageLabel: TLabel;
    SendEmailBtn: TCheckBox;
    Info: TJvComputerInfoEx;
    ShutdownBtn: TCheckBox;
    AboutBtn: TButton;
    DonateBtn: TButton;
    ImageList1: TImageList;
    MinimizeToTrayBtn: TJvCaptionButton;
    TrayIcon: TJvTrayIcon;
    GeneralPage: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    LogsBtn: TButton;
    FormStorage: TJvFormStorage;
    AppIniFileStorage: TJvAppIniFileStorage;
    procedure FormCreate(Sender: TObject);
    procedure RunJobsBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchSourceFilesFindFile(Sender: TObject; const AName: string);
    procedure FormShow(Sender: TObject);
    procedure OperationThreadRun(Sender: TIdThreadComponent);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure AddNewProjectBtnClick(Sender: TObject);
    procedure EditProjectBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure JobsListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SearchSourceFilesFindDirectory(Sender: TObject;
      const AName: string);
    procedure OperationThreadException(Sender: TIdThreadComponent;
      AException: Exception);
    procedure SearchDestFilesFindDirectory(Sender: TObject;
      const AName: string);
    procedure LogListData(Sender: TObject; Item: TListItem);
    procedure ErrorLogData(Sender: TObject; Item: TListItem);
    procedure FullLogListData(Sender: TObject; Item: TListItem);
    procedure O1Click(Sender: TObject);
    procedure O2Click(Sender: TObject);
    procedure SelectAllLabelClick(Sender: TObject);
    procedure SelectNoneLabelClick(Sender: TObject);
    procedure SelectReverseLabelClick(Sender: TObject);
    procedure SpeedTimerTimer(Sender: TObject);
    procedure PassedTimeTimerTimer(Sender: TObject);
    procedure ConfEmailBtnClick(Sender: TObject);
    procedure ProgressTimerTimer(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure LogBtnClick(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
    procedure MinimizeToTrayBtnClick(Sender: TObject);
    procedure TrayIconBalloonClick(Sender: TObject);
    procedure LogsBtnClick(Sender: TObject);
    procedure FullLogListCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
  private
    { Private declarations }
    FFiles: TStringList;
    FFolders: TStringList;
    FFileCompare: TFileComperator;
    FTotalCMDCount: integer;
    FStateMsg: string;
    FProgress: integer;
    FStop: Boolean;
    FLogLineToAdd: TLogItem;
    FMaxProgress: integer;
    FItemIndex: integer;
    FCurrentProjectName: string;
    FGeneralLogItems: TLogFile;
    FErrorLogItems: TLogFile;
    FAll, FRun, FExit, FShutDown: Boolean;
    FChangeCount: integer;
    FTimeCounter: int64;
    FTotalTimeCounter: integer;
    FCompareMethodId: integer;
    FPreview: Boolean;
    FSendEmail: Boolean;
    FFileTypeSplitList: TStringList;

    procedure Log(LogItem: TLogItem);
    procedure LogError(LogItem: TLogItem);
    procedure LogFull(LogItem: TLogItem);
    procedure ResetLogItem(var LogItem: TLogItem);
    procedure AddToLog();
    procedure AddToErrorLog();
    procedure AddToFullLog();
    procedure CloseQueue();
    procedure ShutDown();
    procedure UpdateChangeCount();
    procedure UpdateProgress();
    procedure UpdateState();
    procedure StopPassedTimeTimer();
    procedure StartSpeedTimer();
    procedure StopSpeedTimer();
    procedure StartProgressTimer();
    procedure StopProgressTimer();
    procedure ShowPreviewResults();
    procedure ShowBalloon();

    procedure UpdateMaxProgres();
    procedure JumpToItem();
    procedure UpdateProjectName;

    procedure DisableUI;
    procedure EnableUI;

    procedure SaveSettings;
    procedure LoadSettings;

    function CheckIfFileCanBeAdded(const FilePath: string):Boolean;

    function CopyFileUsingSHFO(const Source: string; const Dest: string):Boolean;
  public
    { Public declarations }
    FProjects: TProjectFiles;
    FFullLogItems: TLogFile;
    LastLogFilePath: string;
    AppDataFolder: string;

    procedure SaveProjects;
    procedure LoadProjects;

    function CompareMethodToStr(const MethodId: integer):string;
  end;

var
  MainForm: TMainForm;

const
  PROGRAM_TITLE = 'OneWay Backup RC';

implementation

{$R *.dfm}

uses UnitProjectSettingsForm, UnitEmailConfig, UnitLog, UnitAbout, UnitLogs;

procedure TMainForm.AboutBtnClick(Sender: TObject);
begin
  AboutForm.Show;
  Self.Enabled := False;
end;

procedure TMainForm.AddNewProjectBtnClick(Sender: TObject);
begin
  // default project settings
  ProjectSettingsForm.FItemIndex := -1;
  ProjectSettingsForm.DestDirEdit.Clear;
  ProjectSettingsForm.SourceDirEdit.Clear;
  ProjectSettingsForm.ProjectNameEdit.Clear;
  ProjectSettingsForm.BufferEdit.Text := '8192';
  ProjectSettingsForm.DeleteFromDestBtn.Checked := False;
  ProjectSettingsForm.Show;
  Self.Enabled := False;
end;

procedure TMainForm.AddToErrorLog;
begin   
  try
    LogError(FLogLineToAdd);
  except on E: Exception do
  end;
end;

procedure TMainForm.AddToFullLog;
begin   
  try
    LogFull(FLogLineToAdd);
  except on E: Exception do
  end;
end;

procedure TMainForm.AddToLog;
begin
  try
    Log(FLogLineToAdd);
  except on E: Exception do
  end;
end;

function TMainForm.CheckIfFileCanBeAdded(const FilePath: string): Boolean;
var
  I: Integer;
  LFileExt: string;
begin
  Result := True;
  // file's extension
  LFileExt := ExtractFileExt(FilePath).ToLower;

  if FFileTypeSplitList.Count > 0 then
  begin
    for I := 0 to FFileTypeSplitList.Count-1 do
    begin
      // if file's extension is in ignore list
      if LFileExt = FFileTypeSplitList[i].ToLower then
      begin
        Result := False;
        Break;
      end;
    end;
  end;
end;

procedure TMainForm.CloseQueue;
begin
  if FRun and FExit then
  begin
    Self.Close;
  end;
end;

function TMainForm.CompareMethodToStr(const MethodId: integer): string;
begin
  case MethodId of
    0:
      Result := 'Full file search';
    1:
      Result := 'Compare MD5';
    2:
      Result := 'Compare sizes';
    3:
      Result := 'Last modified date';
  end;
end;

procedure TMainForm.ConfEmailBtnClick(Sender: TObject);
begin
  Self.Enabled := False;
  EmailConfForm.Show;
end;

function TMainForm.CopyFileUsingSHFO(const Source, Dest: string): Boolean;
var
  shFOS : TShFileOpStruct;
begin
  shFOS.Wnd := Application.MainForm.Handle;
  shFOS.wFunc := FO_COPY;
  shFOS.pFrom := PWideChar(Source + #0);
  shFOS.pTo := PWideChar(Dest + #0);
  shFOS.fFlags := FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR or FOF_NOERRORUI;
  Result := 0 = SHFileOperation(shFOS);
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := JobsList.Items.Count-1 downto 0 do
  begin
    if JobsList.Items[i].Selected then
    begin
      FProjects.Delete(i);
      JobsList.Items.Delete(i);
    end;
  end;
  SaveProjects;
  FProjects.Clear;
  JobsList.Items.Clear;
  LoadProjects;
end;

procedure TMainForm.DisableUI;
begin
  JobsList.Enabled := False;
  RunJobsBtn.Enabled := False;
  AddNewProjectBtn.Enabled  := False;
  EditProjectBtn.Enabled := False;
  StopBtn.Enabled := True;
  ActivatePanel.Enabled := False;
  ConfEmailBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  PreviewBtn.Enabled := False;
  AboutBtn.Enabled := False;
end;

procedure TMainForm.EditProjectBtnClick(Sender: TObject);
begin
  if JobsList.ItemIndex > -1 then
  begin
    ProjectSettingsForm.FItemIndex := JobsList.ItemIndex;
    ProjectSettingsForm.Show;
    Self.Enabled := False;
  end;
end;

procedure TMainForm.EnableUI;
begin
  JobsList.Enabled := True;
  RunJobsBtn.Enabled := True;
  AddNewProjectBtn.Enabled  := True;
  EditProjectBtn.Enabled := True;
  StopBtn.Enabled := False;
  ActivatePanel.Enabled := True;
  ConfEmailBtn.Enabled := True;
  AboutBtn.Enabled := True;
  StateLabel.Caption := '';
  ProjectNameLabel.Caption := '';
  ChangesLabel.Caption := '';
  SpeedLabel.Caption := '';
  TimeLabel.Caption := '';
  ProgressBar.Position := 0;
  Taskbar1.ProgressValue := 0;
  PercentageLabel.Caption := '0%';
  Self.Caption := PROGRAM_TITLE;
  DeleteBtn.Enabled := True;
  PreviewBtn.Enabled := True;
  GeneralPage.ActivePageIndex := 0;
end;

procedure TMainForm.ErrorLogData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < FErrorLogItems.Count then
  begin
    Item.Caption := FErrorLogItems.LogItems[Item.Index].AddDate;
    Item.SubItems.Add(FErrorLogItems.LogItems[Item.Index].Source);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // stop all possible operations
  FStop := True;
  if SearchSourceFiles.Searching then
  begin
    SearchSourceFiles.Abort;
  end;
  if SearchDestFiles.Searching then
  begin
    SearchDestFiles.Abort;
  end;
  FFileCompare.Stop := True;
  if not OperationThread.Terminated then
  begin
    OperationThread.Terminate;
    while not OperationThread.Terminated do
    begin
      OperationThread.Terminate;
    end;
  end;

  SaveProjects;
  SaveSettings;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SearchSourceFiles.RecurseDepth := MaxInt;
  SearchDestFiles.RecurseDepth := MaxInt;

  FFiles := TStringList.Create;
  FFolders := TStringList.Create;
  FFileCompare := TFileComperator.Create;
  FProjects := TProjectFiles.Create;
  FFullLogItems := TLogFile.Create;
  FGeneralLogItems := TLogFile.Create;
  FErrorLogItems := TLogFile.Create;

  {$IFDEF PORTABLE}
    AppDataFolder := ExtractFileDir(Application.ExeName);
  {$ENDIF}
  {$IFDEF INSTALLED}
    AppDataFolder := Info.Folders.AppData + '\OneWayBackup';
  {$ENDIF}

  // program last location, size and state
  AppIniFileStorage.FileName := AppDataFolder + '\location.ini';

  if not DirectoryExists(AppDataFolder) then
  begin
    if not ForceDirectories(AppDataFolder) then
    begin
      Application.MessageBox('Unable to create appdata folder.', 'Fatal Error', MB_ICONERROR);
      Application.Terminate;
    end;
  end;

  if not DirectoryExists(AppDataFolder + '\logs\') then
  begin
    ForceDirectories(AppDataFolder + '\logs\')
  end;

  GeneralPage.Pages[0].TabVisible := False;
  GeneralPage.Pages[1].TabVisible := False;
  GeneralPage.ActivePageIndex := 0;
  FFileTypeSplitList := TStringList.Create;
  FFileTypeSplitList.StrictDelimiter := True;
  FFileTypeSplitList.Delimiter := ';';
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  FFiles.Free;
  FFolders.Free;
  FFileCompare.free;
  for I := 0 to FProjects.Count-1 do
  begin
    FProjects[i].Free;
  end;
  FFullLogItems.Free;
  FGeneralLogItems.Free;
  FErrorLogItems.Free;
  FFileTypeSplitList.Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  JobsList.Columns[1].Width := (JobsList.ClientWidth - JobsList.Columns[0].Width - JobsList.Columns[3].Width - JobsList.Columns[4].Width - JobsList.Columns[5].Width - 20) div 2;
  JobsList.Columns[2].Width := (JobsList.ClientWidth - JobsList.Columns[0].Width - JobsList.Columns[3].Width - JobsList.Columns[4].Width - JobsList.Columns[5].Width - 20) div 2;

  ErrorLog.Columns[1].Width := ErrorLog.ClientWidth - 20 - ErrorLog.Columns[0].Width;
//  FullLogList.Columns[1].Width := FullLogList.ClientWidth - 20 - FullLogList.Columns[0].Width;
  LogList.Columns[1].Width := LogList.ClientWidth - 20 - LogList.Columns[0].Width;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  I: Integer;
  LParamStr: string;
begin
  // place label on the progressbar
  // looks better this way
  PercentageLabel.Parent := ProgressBar;
  PercentageLabel.AutoSize := False;
  PercentageLabel.Transparent := True;
  PercentageLabel.Top :=  0;
  PercentageLabel.Left :=  0;
  PercentageLabel.Width := ProgressBar.ClientWidth;
  PercentageLabel.Height := ProgressBar.ClientHeight;
  PercentageLabel.Alignment := taCenter;
  PercentageLabel.Layout := tlCenter;

  Self.Caption := PROGRAM_TITLE;
  LoadProjects;
  LoadSettings;

  // default values
  FAll := False;
  FRun := False;
  FExit := False;
  FShutDown := False;
  FCompareMethodId := -1;
  FSendEmail := False;

  // parse command lines
  for I := 1 to ParamCount do
  begin
    LParamStr := LowerCase(ParamStr(i));

    if LParamStr = '/all' then
    begin
      FAll := True;
    end
    else if LParamStr = '/run' then
    begin
      FRun := True;
    end
    else if LParamStr = '/exit' then
    begin
      FExit := True;
    end
    else if LParamStr = '/shutdown' then
    begin
      FShutDown := True;
    end
    else if LParamStr = '/sendmail' then
    begin
      FSendEmail := True;
    end
    else if LParamStr = '/method0' then
    begin
      FCompareMethodId := 0;
    end
    else if LParamStr = '/method1' then
    begin
      FCompareMethodId := 1;
    end
    else if LParamStr = '/method2' then
    begin
      FCompareMethodId := 2;
    end
    else if LParamStr = '/method3' then
    begin
      FCompareMethodId := 3;
    end;
  end;

  if FRun then
  begin
    RunJobsBtnClick(Self);
  end;
end;

procedure TMainForm.FullLogListCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if SubItem = 1 then
  begin
    if item.SubItems[0] = 'Error' then
    begin
      Sender.Canvas.Font.Color := clRed;
    end
    else if Item.SubItems[0] = 'Info' then
    begin
      Sender.Canvas.Font.Color := clBlue;
    end
    else if Item.SubItems[0] = 'Success' then
    begin
      Sender.Canvas.Font.Color := clGreen;
    end
    else
    begin
      Sender.Canvas.Font.Color := clBlack;
    end;
  end
  else
  begin
    Sender.Canvas.Font.Color := clBlack;
  end;
end;

procedure TMainForm.FullLogListData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < FFullLogItems.Count then
  begin
    Item.Caption := FFullLogItems.LogItems[Item.Index].AddDate;
    Item.SubItems.Add(FFullLogItems.LogItems[Item.Index].LogType);
    Item.SubItems.Add(FFullLogItems.LogItems[Item.Index].Source);
    Item.SubItems.Add(FFullLogItems.LogItems[Item.Index].Operation);
    Item.SubItems.Add(FFullLogItems.LogItems[Item.Index].Destination);
    Item.SubItems.Add(FFullLogItems.LogItems[Item.Index].Reason);
  end;
end;

procedure TMainForm.JobsListMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  LListItem: TListItem;
  LHitTest: THitTests;
begin
  // this handles project state saving
  if JobsList.Items.Count > 0 then
  begin
    LListItem := JobsList.GetItemAt(x, y);
    if LListItem <> nil then
    begin
      if LListItem.Selected = false then
        LListItem.Selected := true;
    end
    else
      exit;
    LHitTest := JobsList.GetHitTestInfoAt(x, y);
    if LHitTest = [htOnStateIcon] then
    begin
      FProjects[LListItem.Index].Active := JobsList.Items[LListItem.Index].Checked;
      SaveProjects;
    end;
  end;
end;

procedure TMainForm.JumpToItem;
begin
  JobsList.ItemIndex := FItemIndex;
  if FItemIndex > 0 then
  begin
    JobsList.Items[FItemIndex-1].Selected := False;
  end;

  JobsList.Items[FItemIndex].Selected := True;
  JobsList.Items[FItemIndex].MakeVisible(False);
end;

procedure TMainForm.LoadProjects;
var
  LProject: TProjectFile;
  LItem: TListItem;
  LProjectFile: TStringList;
  I: Integer;
  LLine: string;
  LSplitList: TStringList;
begin
  if FileExists(AppDataFolder + '\data.dat') then
  begin
    LProjectFile := TStringList.Create;
    try
      LProjectFile.LoadFromFile(AppDataFolder + '\data.dat', TEncoding.UTF8);

      LSplitList := TStringList.Create;
      try
        LSplitList.StrictDelimiter := True;
        // each project property on a line
        // is seperated by a |
        LSplitList.Delimiter := '|';

        // each line represents a project
        for I := 0 to LProjectFile.Count-1 do
        begin
          LLine := LProjectFile[i].Trim;
          LSplitList.DelimitedText := LLine;
          // this value (8) may change as more properties
          // are added to projects

          // todo: check for | when a value is entered while
          // creating or editing a project
          if LSplitList.Count = 8 then
          begin
            LProject := TProjectFile.Create();

            LProject.SourceFolder := LSplitList[0];
            LProject.DestFolder := LSplitList[1];
            LProject.ProjectName := LSplitList[2];
            if LSplitList[3] = 'True' then LProject.Active := True Else LProject.Active := False;
            if LSplitList[4] = 'True' then LProject.DeleteFromDest := True Else LProject.DeleteFromDest := False;
            LProject.BufferSize := LSplitList[5].ToInteger();
            LProject.IgnoredFileTypes := LSplitList[6];
            LProject.CompareMethod := LSplitList[7].ToInteger();
            FProjects.Add(LProject);

            LItem := JobsList.Items.Add;
            LItem.Caption := LProject.ProjectName;
            LItem.SubItems.Add(LProject.SourceFolder);
            LItem.SubItems.Add(LProject.DestFolder);
            LItem.SubItems.Add(LProject.BufferSize.ToString());
            LItem.SubItems.Add(LProject.IgnoredFileTypes);
            LItem.SubItems.Add(CompareMethodToStr(LProject.CompareMethod));
            LItem.Checked := LProject.Active;
          end;
        end;
      finally
        LSplitList.Free;
      end;
    finally
      LProjectFile.Free;
    end;
  end;
end;

procedure TMainForm.LoadSettings;
var
  LSettingsFile: TIniFile;
begin
  LSettingsFile := TIniFile.Create(AppDataFolder + '\settings.ini');
  try
    with LSettingsFile do
    begin
      SendEmailBtn.Checked := ReadBool('general', 'sendemail', false);
      ShutdownBtn.Checked := ReadBool('general', 'shutdown', false);
    end;
  finally
    LSettingsFile.Free;
  end;
end;

procedure TMainForm.Log(LogItem: TLogItem);
begin
  LogItem.AddDate := DateTimeToStr(Now);
  FFullLogItems.LogItems.Add(LogItem);
  FGeneralLogItems.LogItems.Add(LogItem);

  FullLogList.Items.Count := FFullLogItems.Count;
  FullLogList.ItemIndex := FullLogList.Items.Count-1;
  LogList.Items.Count := FGeneralLogItems.Count;
  LogList.ItemIndex := FGeneralLogItems.Count-1;

  LogList.Items[LogList.Items.Count-1].MakeVisible(False);
  FullLogList.Items[FullLogList.Items.Count-1].MakeVisible(False);
end;

procedure TMainForm.LogBtnClick(Sender: TObject);
begin
  LogForm.LogList.Items.Count := FFullLogItems.Count;
  LogForm.Show;
end;

procedure TMainForm.LogError(LogItem: TLogItem);
begin
  LogItem.AddDate := DateTimeToStr(Now);
  FErrorLogItems.LogItems.Add(LogItem);
  FFullLogItems.LogItems.Add(LogItem);

  LogsPages.Pages[1].Caption := 'Error Log ('+ FErrorLogItems.Count.ToString() +')';

  FullLogList.Items.Count := FFullLogItems.Count;
  FullLogList.ItemIndex := FullLogList.Items.Count-1;
  ErrorLog.Items.Count := FErrorLogItems.Count;
  ErrorLog.ItemIndex := ErrorLog.Items.Count-1;

  ErrorLog.Items[ErrorLog.Items.Count-1].MakeVisible(False);
  FullLogList.Items[FullLogList.Items.Count-1].MakeVisible(False);
end;

procedure TMainForm.LogFull(LogItem: TLogItem);
begin
  LogItem.AddDate := DateTimeToStr(Now);
  FFullLogItems.LogItems.Add(LogItem);

  FullLogList.Items.Count := FFullLogItems.Count;
  FullLogList.ItemIndex := FullLogList.Items.Count-1;

  FullLogList.Items[FullLogList.Items.Count-1].MakeVisible(False);
end;

procedure TMainForm.LogListData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < FGeneralLogItems.Count then
  begin
    Item.Caption := FGeneralLogItems.LogItems[Item.Index].AddDate;
    Item.SubItems.Add(FGeneralLogItems.LogItems[Item.Index].Source);
  end;
end;

procedure TMainForm.LogsBtnClick(Sender: TObject);
begin
  LogsForm.Show;
end;

procedure TMainForm.MinimizeToTrayBtnClick(Sender: TObject);
begin
  TrayIcon.HideApplication;
end;

procedure TMainForm.O1Click(Sender: TObject);
begin
  if JobsList.ItemIndex > -1 then
  begin
    ShellExecute(handle, 'open', PWideChar(FProjects[JobsList.ItemIndex].SourceFolder), nil, nil, SW_NORMAL);
  end;
end;

procedure TMainForm.O2Click(Sender: TObject);
begin
  if JobsList.ItemIndex > -1 then
  begin
    ShellExecute(handle, 'open', PWideChar(FProjects[JobsList.ItemIndex].DestFolder), nil, nil, SW_NORMAL);
  end;
end;

procedure TMainForm.OperationThreadException(Sender: TIdThreadComponent;
  AException: Exception);
begin
  try
    ResetLogItem(FLogLineToAdd);
    FLogLineToAdd.LogType := 'Error';
    FLogLineToAdd.Operation := 'Thread';
    FLogLineToAdd.Reason := AException.Message;
    OperationThread.Synchronize(AddToErrorLog);
  except on E: Exception do
  end;
end;

procedure TMainForm.OperationThreadRun(Sender: TIdThreadComponent);
var
  I, J: Integer;
  LSourceFile: string;
  LDestFile: string;
  LCopy: Boolean;
  LCopiedCount: integer;
  LFileCopyPair: TFileCopyPair;
  LFileCopyPairs: TFileCopyPairs;
  LFileCopyAgainPairs: TFileCopyPairs;
  LDateTime: TDateTime;
  LFilesToDelete: TStringList;
  LDirsToDelete: TStringList;
  LDirToCreate: TFolderCreatePair;
  LDirsToCreate: TFolderCreatePairs;
  LSourceDir, LDestDir: string;
  LLogFilePath: string;
  LLogItem: TLogItem;
  LDiffReason: string;
  LEmailSetFile: TIniFile;
  LFrom, LTo, LHost, LPort, LPass, LUser: string;
  LCompareMethodId: integer;
  LZipLogFile: string;
  LAttachment: TIdAttachment;
begin
  OperationThread.Synchronize(StartProgressTimer);
  if FPreview then
  begin
    ResetLogItem(FLogLineToAdd);
    FLogLineToAdd.LogType := 'Info';
    FLogLineToAdd.Source := 'This is a preview';
    OperationThread.Synchronize(AddToLog);
  end;
  LDateTime := Now;
//  ProgressTimer.Enabled := True;
  try
    JobsList.ItemIndex := -1;
    for J := 0 to FProjects.Count-1 do
    begin
      if FStop then
      begin
        Break;
      end;
      if FProjects[J].Active or (FRun and FAll) then
      begin
        if FCompareMethodId = -1 then
        begin
          LCompareMethodId := FProjects[J].CompareMethod;
        end
        else
        begin
          LCompareMethodId := FCompareMethodId;
        end;

        // loop through all available projects
        FItemIndex := J;
        OperationThread.Synchronize(JumpToItem);

        FCurrentProjectName := Format('%d/%d %s', [(j+1), FProjects.Count, FProjects[J].ProjectName]);
        OperationThread.Synchronize(UpdateProjectName);
        ResetLogItem(FLogLineToAdd);
        FLogLineToAdd.LogType := 'Info';
        FLogLineToAdd.Source := 'Starting ' + FProjects[J].ProjectName;
        OperationThread.Synchronize(AddToLog);
        ResetLogItem(FLogLineToAdd);
        FLogLineToAdd.LogType := 'Info';
        FLogLineToAdd.Source := 'Using ' + CompareMethodToStr(LCompareMethodId);
        OperationThread.Synchronize(AddToLog);
        // file types that will be ignored
        FFileTypeSplitList.DelimitedText := FProjects[J].IgnoredFileTypes;

        // reset lists
        FProgress := 0;
        FFiles.Clear;
        FFolders.Clear;
        FChangeCount := 0;
        //OperationThread.Synchronize(UpdateChangeCount);
        if DirectoryExists(FProjects[J].SourceFolder) and (not FStop) then
        begin
          // list all the files in the source folder
          SearchSourceFiles.RootDirectory := FProjects[J].SourceFolder;
          SearchSourceFiles.Search;
          ResetLogItem(FLogLineToAdd);
          FLogLineToAdd.LogType := 'Info';
          FLogLineToAdd.Source := 'Found ' + FFiles.Count.ToString() + ' files';
          OperationThread.Synchronize(AddToLog);

          LCopiedCount := 0;
          FTotalCMDCount := 0;
          // create a list to hold the names of the files that will be copied
          LFileCopyPairs := TFileCopyPairs.Create;
          LFileCopyAgainPairs := TFileCopyPairs.Create;
          try
            FMaxProgress := FFiles.Count;
            OperationThread.Synchronize(UpdateMaxProgres);

{$REGION 'singlethreaded compare'}
            // compare all source files with their destination counterparts
            OperationThread.Synchronize(StartSpeedTimer);
            for I := 0 to FFiles.Count-1 do
            begin
              FProgress := i+1;
              if FStop then
              begin
                Break;
              end;
              LSourceFile := FFiles[i].Trim;

              FStateMsg := 'Looking for changes ' + i.ToString + '/' + FFiles.Count.ToString + ' (' + LSourceFile + ')';

              LCopy := false;
              // replace source folder path with destination folder path
              LDestFile := LSourceFile.Replace(FProjects[J].SourceFolder, FProjects[J].DestFolder);
              if not FileExists(LDestFile) then
              begin
                LCopy := True;
                LDiffReason := 'Destination file doesn''t exist';
              end
              else
              begin
                try
                  LCopy := not FFileCompare.CompareFiles(LSourceFile, LDestFile, FProjects[J].BufferSize, LCompareMethodId, LDiffReason);
                except on E: Exception do
                  begin
                    ResetLogItem(FLogLineToAdd);
                    FLogLineToAdd.LogType := 'Error';
                    FLogLineToAdd.Source := 'File read error: ' + E.Message + '[' + LSourceFile + ']';
                    OperationThread.Synchronize(AddToErrorLog);
                    Continue;
                  end;
                end;
              end;

              if LCopy then
              begin
                if not DirectoryExists(ExtractFileDir(LDestFile)) then
                begin
                  if not FPreview then
                  begin
                    ForceDirectories(ExtractFileDir(LDestFile));
                  end;
                end;
                LFileCopyPair.SourceFile := LSourceFile;
                LFileCopyPair.DestFile := LDestFile;

                ResetLogItem(FLogLineToAdd);
                FLogLineToAdd.LogType := 'Info';
                FLogLineToAdd.Source := LSourceFile;
                FLogLineToAdd.Destination := LDestFile;
                FLogLineToAdd.Operation := 'Copy file';
                FLogLineToAdd.Reason := LDiffReason;
                OperationThread.Synchronize(AddToFullLog);

                LFileCopyPairs.Add(LFileCopyPair);
                FChangeCount := LFileCopyPairs.Count;
                OperationThread.Synchronize(UpdateChangeCount);
              end;
            end;
            OperationThread.Synchronize(StopSpeedTimer);
{$ENDREGION}

            // list directories that will be created at destination
            if not FStop then
            begin
              LDirsToCreate := TFolderCreatePairs.Create;
              try
                FMaxProgress := FFolders.Count;
                OperationThread.Synchronize(UpdateMaxProgres);
                for I := 0 to FFolders.Count-1 do
                begin
                  if FStop then
                    Break;

                  FProgress := i + 1;
                  LSourceDir := FFolders[i].Trim;

                  // check if directory exists in destination
                  FStateMsg := 'Checking directory ' + LSourceDir;
                  LDestDir := LSourceDir.Replace(FProjects[J].SourceFolder, FProjects[J].DestFolder);
                  if not DirectoryExists(LDestDir) then
                  begin
                    LDirToCreate.Directory := LDestDir;
                    LDirToCreate.Attributes := FileGetAttr(LSourceDir);
                    LDirsToCreate.Add(LDirToCreate);
                  end;
                end;
              finally
                if LDirsToCreate.Count > 0 then
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Info';
                  FLogLineToAdd.Source := 'Number of directories to be created: ' + LDirsToCreate.Count.ToString();
                  OperationThread.Synchronize(AddToLog);
                end
                else
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Info';
                  FLogLineToAdd.Source := 'No directories will be created at the output.';
                  OperationThread.Synchronize(AddToLog);
                end;
                // create all directories that do not exist in the destination
                FMaxProgress := LDirsToCreate.Count;
                OperationThread.Synchronize(UpdateMaxProgres);
                for I := 0 to LDirsToCreate.Count-1 do
                begin
                  if FStop then
                    Break;

                  FProgress := i + 1;
                  FStateMsg := 'Creating directory ' + LDirsToCreate[i].Directory;
                  try
                    if not FPreview then
                    begin
                      if not DirectoryExists(LDirsToCreate[i].Directory) then
                      begin
                        if not ForceDirectories(LDirsToCreate[i].Directory) then
                        begin
                          RaiseLastOSError;
                        end
                        else
                        begin
                          ResetLogItem(FLogLineToAdd);
                          FLogLineToAdd.LogType := 'Info';
                          FLogLineToAdd.Destination := LDirsToCreate[i].Directory;
                          FLogLineToAdd.Operation := 'Create directory';
                          FLogLineToAdd.Reason := 'Folder did not exist';
                          OperationThread.Synchronize(AddToFullLog);
                        end;
                      end;
                    end;
                  except on E: Exception do
                  begin
                    ResetLogItem(FLogLineToAdd);
                    FLogLineToAdd.LogType := 'Error';
                    FLogLineToAdd.Destination := LDirsToCreate[i].Directory;
                    FLogLineToAdd.Operation := 'Create directory';
                    FLogLineToAdd.Reason := E.Message;
                    OperationThread.Synchronize(AddToErrorLog);
                    Continue;
                  end;
                  end;
                end;
                LDirsToCreate.Free;
              end;
            end;

            // copy all the altered files from source to destination
            if not FStop then
            begin
              if LFileCopyPairs.Count > 0 then
              begin
                  ResetLogItem(FLogLineToAdd);
                FLogLineToAdd.LogType := 'Info';
                FLogLineToAdd.Source := 'Number of files to be copied: ' + LFileCopyPairs.Count.ToString();
                OperationThread.Synchronize(AddToLog);
              end
              else
              begin
                ResetLogItem(FLogLineToAdd);
                FLogLineToAdd.LogType := 'Info';
                FLogLineToAdd.Source := 'No changes found.';
                OperationThread.Synchronize(AddToLog);
              end;

              if not FPreview then
              begin
                FMaxProgress := LFileCopyPairs.Count;
                OperationThread.Synchronize(UpdateMaxProgres);
                OperationThread.Synchronize(StartSpeedTimer);
                for I := 0 to LFileCopyPairs.Count-1 do
                begin
                  if FStop then
                  begin
                    Break;
                  end;

                  FProgress := i+1;
                  FStateMsg := 'Copying ' + i.ToString + '/' + LFileCopyPairs.Count.ToString + ' (' + LFileCopyPairs[i].DestFile + ')';
                  try
                    if FileExists(LFileCopyPairs[i].DestFile) then
                    begin
                      DeleteFile(LFileCopyPairs[i].DestFile);
                    end;

                    TFile.Copy(LFileCopyPairs[i].SourceFile, LFileCopyPairs[i].DestFile, True);
                    ResetLogItem(FLogLineToAdd);
                    FLogLineToAdd.LogType := 'Success';
                    FLogLineToAdd.Source := LFileCopyPairs[i].SourceFile;
                    FLogLineToAdd.Destination := LFileCopyPairs[i].DestFile;
                    FLogLineToAdd.Operation := 'Copy file';
                    OperationThread.Synchronize(AddToFullLog);
                  except on E: Exception do
                    begin
                      LFileCopyAgainPairs.Add(LFileCopyPairs[i]);
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Error';
                      FLogLineToAdd.Source := LFileCopyPairs[i].SourceFile;
                      FLogLineToAdd.Destination := LFileCopyPairs[i].DestFile;
                      FLogLineToAdd.Operation := 'Copy file';
                      FLogLineToAdd.Reason := E.Message;
                      OperationThread.Synchronize(AddToFullLog);
                      Continue;
                    end;
                  end;
                end;
                OperationThread.Synchronize(StopSpeedTimer);
              end;

              // try to copy files that couldn't be copied earlier
              if not FStop then
              begin
                if LFileCopyAgainPairs.Count > 0 then
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Info';
                  FLogLineToAdd.Source := 'Trying to copy again: ' + LFileCopyAgainPairs.Count.ToString();
                  OperationThread.Synchronize(AddToLog);
                end;
                if not FPreview then
                begin
                  FMaxProgress := LFileCopyAgainPairs.Count;
                  OperationThread.Synchronize(UpdateMaxProgres);
                  OperationThread.Synchronize(StartSpeedTimer);
                  for I := 0 to LFileCopyAgainPairs.Count-1 do
                  begin
                    if FStop then
                    begin
                      Break;
                    end;

                    FProgress := i+1;
                    FStateMsg := 'Copying ' + i.ToString + '/' + LFileCopyAgainPairs.Count.ToString + ' (' + LFileCopyAgainPairs[i].DestFile + ')';
                    try
                      if FileExists(LFileCopyAgainPairs[i].DestFile) then
                      begin
                        DeleteFile(LFileCopyAgainPairs[i].DestFile);
                      end;

                      // report if copy fails
                      if not CopyFile(PWideChar(LFileCopyAgainPairs[i].SourceFile), PWideChar(LFileCopyAgainPairs[i].DestFile), false) then
                      begin
                        RaiseLastOSError;
                      end
                      else
                      begin
                        ResetLogItem(FLogLineToAdd);
                        FLogLineToAdd.LogType := 'Success';
                        FLogLineToAdd.Source := LFileCopyAgainPairs[i].SourceFile;
                        FLogLineToAdd.Destination := LFileCopyAgainPairs[i].DestFile;
                        FLogLineToAdd.Operation := '2nd copy attempt';
                        FLogLineToAdd.Reason := '1st copy failed';
                        OperationThread.Synchronize(AddToFullLog);
                      end;
                    except on E: Exception do
                      begin
                        ResetLogItem(FLogLineToAdd);
                        FLogLineToAdd.LogType := 'Error';
                        FLogLineToAdd.Source := LFileCopyAgainPairs[i].SourceFile;
                        FLogLineToAdd.Destination := LFileCopyAgainPairs[i].DestFile;
                        FLogLineToAdd.Operation := '2nd copy attemp';
                        FLogLineToAdd.Reason := E.Message;
                        OperationThread.Synchronize(AddToFullLog);

                        if not CopyFileUsingSHFO(LFileCopyAgainPairs[i].SourceFile, LFileCopyAgainPairs[i].DestFile) then
                        begin
                          ResetLogItem(FLogLineToAdd);
                          FLogLineToAdd.LogType := 'Error';
                          FLogLineToAdd.Source := LFileCopyAgainPairs[i].SourceFile;
                          FLogLineToAdd.Destination := LFileCopyAgainPairs[i].DestFile;
                          FLogLineToAdd.Operation := 'SHFileOperations file copy';
                          FLogLineToAdd.Reason := E.Message;
                          OperationThread.Synchronize(AddToErrorLog);
                        end
                        else
                        begin
                          ResetLogItem(FLogLineToAdd);
                          FLogLineToAdd.LogType := 'Success';
                          FLogLineToAdd.Source := LFileCopyAgainPairs[i].SourceFile;
                          FLogLineToAdd.Destination := LFileCopyAgainPairs[i].DestFile;
                          FLogLineToAdd.Operation := 'SHFileOperations file copy';
                          OperationThread.Synchronize(AddToLog);
                        end;

                        Continue;
                      end;
                    end;
                  end;
                  OperationThread.Synchronize(StopSpeedTimer);
                end;
              end;
            end;

            if not FStop then
            begin
              // option control
              if FProjects[J].DeleteFromDest then
              begin
                FFiles.Clear;
                FFolders.Clear;
                ResetLogItem(FLogLineToAdd);
                FLogLineToAdd.LogType := 'Info';
                FLogLineToAdd.Source := 'Searching destination for files/folders to be deleted.';
                OperationThread.Synchronize(AddToLog);
                SearchDestFiles.RootDirectory :=  FProjects[J].DestFolder;
                SearchDestFiles.Search;

                // delete file if it does not exist in source but exists in destination
                LFilesToDelete := TStringList.Create();
                try
                  FMaxProgress := FFiles.Count;
                  OperationThread.Synchronize(UpdateMaxProgres);
                  for I := 0 to FFiles.Count-1 do
                  begin
                    if FStop then
                    begin
                      Break;
                    end;
                    FProgress := I + 1;
                    LDestFile := FFiles[i].Trim;
                    FStateMsg := 'Searching file in source folder ' + i.ToString + '/' + FFiles.Count.ToString + ' (' + LDestFile + ')';

                    LSourceFile := LDestFile.Replace(FProjects[J].DestFolder, FProjects[J].SourceFolder);
                    if not FileExists(LSourceFile) then
                    begin
                      LFilesToDelete.Add(LDestFile);
                      FChangeCount := LFilesToDelete.Count;
                    end;
                  end;
                finally
                  if not FStop then
                  begin
                    if LFilesToDelete.Count > 0 then
                    begin
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Info';
                      FLogLineToAdd.Source := 'Number of files to be deleted at destination: ' +  LFilesToDelete.Count.ToString();
                      OperationThread.Synchronize(AddToLog);

                      if not FPreview then
                      begin
                        FMaxProgress := LFilesToDelete.Count;
                        OperationThread.Synchronize(UpdateMaxProgres);
                        for I := 0 to LFilesToDelete.Count-1 do
                        begin
                          if FStop then
                            Break;
                          FProgress := I + 1;
                          try
                            DeleteFile(LFilesToDelete[i]);
                            ResetLogItem(FLogLineToAdd);
                            FLogLineToAdd.LogType := 'Success';
                            FLogLineToAdd.Source :=  LFilesToDelete[i];
                            FLogLineToAdd.Operation := 'Delete file';
                            OperationThread.Synchronize(AddToFullLog);
                          Except on E: Exception do
                          begin
                            ResetLogItem(FLogLineToAdd);
                            FLogLineToAdd.LogType := 'Error';
                            FLogLineToAdd.Source := LFilesToDelete[i];
                            FLogLineToAdd.Operation := 'Delete file';
                            FLogLineToAdd.Reason := E.Message;
                            OperationThread.Synchronize(AddToErrorLog);
                            Continue;
                          end;
                          end;
                        end;
                      end;
                    end
                    else
                    begin
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Info';
                      FLogLineToAdd.Source := 'No files will be deleted in destination';
                      OperationThread.Synchronize(AddToLog);
                    end;
                  end;
                  LFilesToDelete.Free;
                end;

                // delete folder if it does not exist in source but exists in destination
                LDirsToDelete := TStringList.Create;
                try
                  FMaxProgress := FFolders.Count;
                  OperationThread.Synchronize(UpdateMaxProgres);
                  for I := 0 to FFolders.Count-1 do
                  begin
                    if FStop then
                      Break;

                    FProgress := I + 1;
                    LDestDir := FFolders[i].Trim;
                    FStateMsg := 'Searching folder in source folder ' + i.ToString + '/' + FFolders.Count.ToString + ' (' + LDestDir + ')';

                    LSourceDir := LDestDir.Replace(FProjects[J].DestFolder, FProjects[J].SourceFolder);
                    if not DirectoryExists(LSourceDir) then
                    begin
                      LDirsToDelete.Add(LDestDir);
                      FChangeCount := LDirsToDelete.Count;
                    end;
                  end;
                finally
                  if not FStop then
                  begin
                    if LDirsToDelete.Count > 0 then
                    begin
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Info';
                      FLogLineToAdd.Source := 'Number of folders to be deleted at the destination: ' + LDirsToDelete.Count.ToString();
                      OperationThread.Synchronize(AddToLog);

                      if not FPreview then
                      begin
                        FMaxProgress := LDirsToDelete.Count;
                        OperationThread.Synchronize(UpdateMaxProgres);
                        for I := 0 to LDirsToDelete.Count-1 do
                        begin
                          if FStop then
                            Break;
                          FProgress := I + 1;
                          try
                            RemoveDir(LDirsToDelete[i]);
                            ResetLogItem(FLogLineToAdd);
                            FLogLineToAdd.LogType := 'Success';
                            FLogLineToAdd.Source := LDirsToDelete[i];
                            FLogLineToAdd.Operation := 'Delete directory';
                            OperationThread.Synchronize(AddToFullLog);
                          Except on E: Exception do
                            begin
                              ResetLogItem(FLogLineToAdd);
                              FLogLineToAdd.LogType := 'Error';
                              FLogLineToAdd.Source := LDirsToDelete[i];
                              FLogLineToAdd.Operation := 'Delete directory';
                              FLogLineToAdd.Reason := E.Message;
                              OperationThread.Synchronize(AddToErrorLog);
                              Continue;
                            end;
                          end;
                        end;
                      end;
                    end
                    else
                    begin
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Info';
                      FLogLineToAdd.Source := 'No folders will be deleted in destination';
                      OperationThread.Synchronize(AddToLog);
                    end;
                  end;
                  LDirsToDelete.Free;
                end;
              end;
            end;

            if not FStop then
            begin
              // copy folder properties
              FFiles.Clear;
              FFolders.Clear;
              ResetLogItem(FLogLineToAdd);
              FLogLineToAdd.LogType := 'Info';
              FLogLineToAdd.Source := 'Reading source folder properties.';
              OperationThread.Synchronize(AddToLog);
              SearchDestFiles.RootDirectory :=  FProjects[J].SourceFolder;
              SearchDestFiles.Search;

              LDirsToCreate := TFolderCreatePairs.Create;
              try
                FMaxProgress := FFolders.Count;
                OperationThread.Synchronize(UpdateMaxProgres);
                for I := 0 to FFolders.Count-1 do
                begin
                  if FStop then
                    Break;

                  FProgress := i + 1;
                  LSourceDir := FFolders[i].Trim;

                  // check if directory exists in destination
                  FStateMsg := 'Checking directory ' + LSourceDir;
                  LDestDir := LSourceDir.Replace(FProjects[J].SourceFolder, FProjects[J].DestFolder);
                  if DirectoryExists(LDestDir) then
                  begin
                    LDirToCreate.Directory := LDestDir;
                    LDirToCreate.Attributes := FileGetAttr(LSourceDir);
                    LDirsToCreate.Add(LDirToCreate);
                  end;
                end;
              finally
                if LDirsToCreate.Count > 0 then
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Info';
                  FLogLineToAdd.Source := 'Number of directories found to write attributes: ' + LDirsToCreate.Count.ToString();
                  OperationThread.Synchronize(AddToLog);
                end
                else
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Info';
                  FLogLineToAdd.Source := 'No directories found to write attributes';
                  OperationThread.Synchronize(AddToLog);
                end;
                if not FPreview then
                begin
                  // create all directories that do not exist in the destination
                  FMaxProgress := LDirsToCreate.Count;
                  OperationThread.Synchronize(UpdateMaxProgres);
                  for I := 0 to LDirsToCreate.Count-1 do
                  begin
                    if FStop then
                      Break;

                    FProgress := i + 1;
                    FStateMsg := 'Writing attribute to ' + LDirsToCreate[i].Directory;
                    try
                      FileSetAttr(LDirsToCreate[i].Directory, LDirsToCreate[i].Attributes);
                    except on E: Exception do
                    begin
                      ResetLogItem(FLogLineToAdd);
                      FLogLineToAdd.LogType := 'Error';
                      FLogLineToAdd.Destination := LDirsToCreate[i].Directory;
                      FLogLineToAdd.Operation := 'Write attribute to directory';
                      FLogLineToAdd.Reason := E.Message;
                      OperationThread.Synchronize(AddToErrorLog);
                      Continue;
                    end;
                    end;
                  end;
                end;
                LDirsToCreate.Free;
              end;
            end;
          finally
            LFileCopyPairs.Free;
            LFileCopyAgainPairs.Free;
          end;
        end;
        ResetLogItem(FLogLineToAdd);
        FLogLineToAdd.LogType := 'Info';
        FLogLineToAdd.Source := 'Finished ' + FProjects[J].ProjectName;
        OperationThread.Synchronize(AddToLog);
        ResetLogItem(FLogLineToAdd);
        FLogLineToAdd.LogType := '';
        FLogLineToAdd.Source := '';
        OperationThread.Synchronize(AddToLog);
      end
      else
      begin
      ResetLogItem(FLogLineToAdd);
        FLogLineToAdd.LogType := 'Info';
        FLogLineToAdd.Source := 'Skipping ' + FProjects[J].ProjectName;
        OperationThread.Synchronize(AddToFullLog);
      end;
    end;
  finally
    OperationThread.Synchronize(StopSpeedTimer);
//    OperationThread.Synchronize(UpdateState);
    LLogFilePath := AppDataFolder + '\logs\' + FormatDateTime('ddmmyyyyhhnnss', Now) + '.csv';
    if FStop then
    begin
      ResetLogItem(FLogLineToAdd);
      FLogLineToAdd.LogType := 'Info';
      FLogLineToAdd.Source := 'Stopped by user.';
      OperationThread.Synchronize(AddToLog);
    end
    else
    begin
      ResetLogItem(FLogLineToAdd);
      FLogLineToAdd.LogType := 'Info';
      FLogLineToAdd.Source := 'Backup done in ' + FormatDateTime('hh:nn:ss.zzz', Now - LDateTime);
      OperationThread.Synchronize(AddToLog);
    end;
    FStop := True;
    try
    finally
      if (not FPreview) and (SendEmailBtn.Checked or FSendEmail) then
      begin
        FLogLineToAdd.LogType := 'Info';
        FLogLineToAdd.Source := 'Saving and compressing the log';
        OperationThread.Synchronize(AddToLog);
        // this will be sent as an attachment to the mail
        try
          FFullLogItems.WriteToFile(LLogFilePath);
          // compress log to zip
          LZipLogFile := FFullLogItems.CompressLog(LLogFilePath);
          LastLogFilePath := LLogFilePath;
        except on E: Exception do
          begin
            ResetLogItem(FLogLineToAdd);
            FLogLineToAdd.LogType := 'Error';
            FLogLineToAdd.Operation := 'Save log';
            FLogLineToAdd.Reason := E.Message;
            OperationThread.Synchronize(AddToErrorLog);
          end;
        end;

        // send email
        LEmailSetFile := TIniFile.Create(AppDataFolder + '\email.ini');
        try
          with LEmailSetFile do
          begin
            LFrom := ReadString('EMail', 'From', '');
            LTo := ReadString('EMail', 'To', '');
            LHost := ReadString('EMail', 'Host', '');
            LPort := ReadString('EMail', 'Port', '');
            LUser := ReadString('EMail', 'User', '');
            LPass := ReadString('EMail', 'Pass', '');

            if (Length(LFrom) > 0) and (Length(LTo) > 0) and (Length(LHost) > 0) and (Length(LPort) > 0) and (Length(LUser) > 0) and (Length(LPass) > 0) then
            begin
              ResetLogItem(FLogLineToAdd);
              FLogLineToAdd.LogType := 'Info';
              FLogLineToAdd.Source := 'Sending email';
              OperationThread.Synchronize(AddToLog);
              IdMessage1.From.Address := LFrom;
              IdMessage1.Recipients.EMailAddresses := LTo;
              IdMessage1.Body.Text := 'Please see attachment for backup details.';
              IdMessage1.Subject := 'OneWay Backup Report';
              LAttachment := TIdAttachmentFile.Create(IdMessage1.MessageParts, LZipLogFile);
              try
                IdSMTP1.Host := LHost;
                IdSMTP1.Port := StrToInt(LPort);
                IdSMTP1.AuthType := satDefault;
                IdSMTP1.Username := LUser;
                IdSMTP1.Password := LPass;
                IdSMTP1.Connect;
                IdSMTP1.Send(IdMessage1);
                ResetLogItem(FLogLineToAdd);
                FLogLineToAdd.LogType := 'Info';
                FLogLineToAdd.Source := 'Sent email';
                OperationThread.Synchronize(AddToLog);
              except on E: Exception do
                begin
                  ResetLogItem(FLogLineToAdd);
                  FLogLineToAdd.LogType := 'Error';
                  FLogLineToAdd.Operation := 'Send email';
                  FLogLineToAdd.Reason := E.Message;
                  OperationThread.Synchronize(AddToErrorLog);
                end;
              end;
            end;
          end;
        finally
          LEmailSetFile.Free;
          if Assigned(LAttachment) then
          begin
            LAttachment.Free;
          end;
          try
            if FileExists(LZipLogFile) then
            begin
              if '.zip' = ExtractFileExt(LZipLogFile) then
              begin
                DeleteFile(LZipLogFile);
              end;
            end;
          except on E: Exception do
            // ignored
          end;
        end;
      end;

      try
        FFullLogItems.WriteToFile(LLogFilePath);
        LastLogFilePath := LLogFilePath;
      except on E: Exception do
        begin
          ResetLogItem(FLogLineToAdd);
          FLogLineToAdd.LogType := 'Error';
          FLogLineToAdd.Operation := 'Save log';
          FLogLineToAdd.Reason := E.Message;
          OperationThread.Synchronize(AddToErrorLog);
        end;
      end;
    end;
    // post operation stuff
    OperationThread.Synchronize(StopPassedTimeTimer);
    OperationThread.Synchronize(StopProgressTimer);
    OperationThread.Synchronize(EnableUI);
    OperationThread.Synchronize(ShowPreviewResults);
    OperationThread.Synchronize(ShowBalloon);
    OperationThread.Synchronize(ShutDown);
    OperationThread.Synchronize(CloseQueue);
    OperationThread.Terminate;
  end;
end;

procedure TMainForm.PassedTimeTimerTimer(Sender: TObject);
begin
  if not FStop then
  begin
    Inc(FTotalTimeCounter);
    TimeLabel.Caption := 'Time: ' + Format('%.2d:%.2d', [FTotalTimeCounter div 60, FTotalTimeCounter mod 60]);
  end;
end;

procedure TMainForm.PreviewBtnClick(Sender: TObject);
begin
  if LogForm.Visible then
  begin
    LogForm.Close;
  end;
  FPreview := True;
  PassedTimeTimer.Enabled := True;
  FFullLogItems.LogItems.Clear;
  FGeneralLogItems.LogItems.Clear;
  FErrorLogItems.LogItems.Clear;
  FullLogList.Items.Count := 0;
  ErrorLog.Items.Count := 0;
  LogList.Items.Count := 0;
  SpeedLabel.Caption := 'Speed: N/A';
  ChangesLabel.Caption := 'Changes found: 0';
  TimeLabel.Caption := 'Time: 00:00';
  LogsPages.Pages[1].Caption := 'Error Log';
  FTimeCounter := 0;
  FTotalTimeCounter := 0;

  FStop := False;
  DisableUI;
  LogList.Items.Clear;
  GeneralPage.ActivePageIndex := 1;
  OperationThread.Start;
end;

procedure TMainForm.ProgressTimerTimer(Sender: TObject);
begin
  UpdateProgress;
  UpdateState;
  UpdateChangeCount;
end;

procedure TMainForm.ResetLogItem(var LogItem: TLogItem);
begin
  with LogItem do
  begin
    LogType := '';
    AddDate := '';
    Source := '';
    Destination := '';
    Operation := '';
    Reason := '';
  end;
end;

procedure TMainForm.RunJobsBtnClick(Sender: TObject);
begin
  if LogForm.Visible then
  begin
    LogForm.Close;
  end;
  FPreview := False;
  PassedTimeTimer.Enabled := True;
  FFullLogItems.LogItems.Clear;
  FGeneralLogItems.LogItems.Clear;
  FErrorLogItems.LogItems.Clear;
  FullLogList.Items.Count := 0;
  ErrorLog.Items.Count := 0;
  LogList.Items.Count := 0;
  SpeedLabel.Caption := 'Speed: N/A';
  ChangesLabel.Caption := 'Changes found: 0';
  TimeLabel.Caption := 'Time: 00:00';
  LogsPages.Pages[1].Caption := 'Error Log';
  FTimeCounter := 0;
  FTotalTimeCounter := 0;

  FStop := False;
  DisableUI;
  LogList.Items.Clear;
  GeneralPage.ActivePageIndex := 1;
  OperationThread.Start;
end;

procedure TMainForm.SaveProjects;
var
  LProjectFile: TStringList;
  LLine: string;
  I: Integer;
begin
  LProjectFile := TStringList.Create();
  try
    if FileExists(AppDataFolder + '\data.dat') then
    begin
      DeleteFile(AppDataFolder + '\data.dat');
    end;
    for I := 0 to FProjects.Count-1 do
    begin
      LLine := FProjects[i].SourceFolder + '|' + FProjects[i].DestFolder + '|'
        + FProjects[i].ProjectName + '|' + BoolToStr(FProjects[i].Active, True)
        + '|' + BoolToStr(FProjects[i].DeleteFromDest, True) + '|' + FProjects[i].BufferSize.ToString() + '|' + FProjects[i].IgnoredFileTypes + '|' + FProjects[i].CompareMethod.ToString;
      LProjectFile.Add(LLine);
    end;
  finally
    LProjectFile.SaveToFile(AppDataFolder + '\data.dat', TEncoding.UTF8);
    LProjectFile.Free;
  end;
end;

procedure TMainForm.SaveSettings;
var
  LSettingsFile: TIniFile;
begin
  LSettingsFile := TIniFile.Create(AppDataFolder + '\settings.ini');
  try
    with LSettingsFile do
    begin
      WriteBool('general', 'sendemail', SendEmailBtn.Checked);
      WriteBool('general', 'shutdown', ShutdownBtn.Checked);
    end;
  finally
    LSettingsFile.Free;
  end;
end;

procedure TMainForm.SearchDestFilesFindDirectory(Sender: TObject;
  const AName: string);
begin
  FFolders.Add(AName);
end;

procedure TMainForm.SearchSourceFilesFindDirectory(Sender: TObject; const AName: string);
begin
  FFolders.Add(AName);
end;

procedure TMainForm.SearchSourceFilesFindFile(Sender: TObject; const AName: string);
begin
  // for ignore file type options
  if CheckIfFileCanBeAdded(AName) then
  begin
    FFiles.Add(AName);
    FStateMsg := 'Found ' + FFiles.Count.ToString + ' files';
  end;
end;

procedure TMainForm.SelectAllLabelClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to FProjects.Count-1 do
  begin
    FProjects[i].Active := True;
  end;
  SaveProjects;
  for I := 0 to JobsList.Items.Count-1 do
  begin
    JobsList.Items[i].Checked := True;
  end;
end;

procedure TMainForm.SelectNoneLabelClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to FProjects.Count-1 do
  begin
    FProjects[i].Active := False;
  end;
  SaveProjects;
  for I := 0 to JobsList.Items.Count-1 do
  begin
    JobsList.Items[i].Checked := False;
  end;
end;

procedure TMainForm.SelectReverseLabelClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to FProjects.Count-1 do
  begin
    FProjects[i].Active := not FProjects[i].Active;
  end;
  SaveProjects;
  for I := 0 to JobsList.Items.Count-1 do
  begin
    JobsList.Items[i].Checked := not JobsList.Items[i].Checked;
  end;
end;

procedure TMainForm.ShowBalloon;
begin
  if not FShutDown then
  begin
    if not FExit then
    begin
      TrayIcon.BalloonHint('OneWay Backup', 'OneWay Backup is done. Please see logs for more details.');
    end;
  end;
end;

procedure TMainForm.ShowPreviewResults;
begin
  if not FShutDown then
  begin
    if not FExit then
    begin
      LogForm.LogList.Items.Count := FFullLogItems.Count;
      LogForm.Show;
    end;
  end;
end;

procedure TMainForm.ShutDown;
begin
  if FShutDown or ShutdownBtn.Checked then
  begin
    // ugly af
    WinExec('shutdown.exe -s -f -t 0' , SW_HIDE);
  end;
end;

procedure TMainForm.StartProgressTimer;
begin
  ProgressTimer.Enabled := True;
end;

procedure TMainForm.StartSpeedTimer;
begin
  SpeedTimer.Enabled := True;
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
begin
  if ID_YES = Application.MessageBox('Do you want to stop backup process?', 'Question', MB_ICONQUESTION or MB_YESNO) then
  begin
    FStop := True;
    if SearchSourceFiles.Searching then
    begin
      SearchSourceFiles.Abort;
    end;
    if SearchDestFiles.Searching then
    begin
      SearchDestFiles.Abort;
    end;
    FFileCompare.Stop := True;
  end;
end;

procedure TMainForm.StopPassedTimeTimer;
begin
  PassedTimeTimer.Enabled := False;
end;

procedure TMainForm.StopProgressTimer;
begin
  ProgressTimer.Enabled := False;
end;

procedure TMainForm.StopSpeedTimer;
begin
  SpeedTimer.Enabled := False;
   FTimeCounter := 0;
end;

procedure TMainForm.TrayIconBalloonClick(Sender: TObject);
begin
  TrayIcon.ShowApplication;
end;

procedure TMainForm.SpeedTimerTimer(Sender: TObject);
var
  LValue: Double;
begin
  Inc(FTimeCounter);
  LValue := FProgress / FTimeCounter;
  SpeedLabel.Caption := 'Speed: ' + Format('%.2f', [LValue]) + ' files per second';
end;

procedure TMainForm.UpdateChangeCount;
begin
  ChangesLabel.Caption := 'Changes found: ' + FloatToStr(FChangeCount);
end;

procedure TMainForm.UpdateMaxProgres;
begin
  ProgressBar.Max := FMaxProgress;
  Taskbar1.ProgressMaxValue := FMaxProgress;
end;

procedure TMainForm.UpdateProgress;
var
  LProgress: Extended;
  LProgressStr: string;
begin
  ProgressBar.Position := FProgress;
  Taskbar1.ProgressValue := FProgress;
  if FMaxProgress > 0 then
  begin
    LProgress := (10000 * FProgress) / FMaxProgress;
    // 32,15 for example
    LProgressStr :=  Format('%.2f', [LProgress/100]) + '%';
    Self.Caption := LProgressStr + ' [' + PROGRAM_TITLE + ']';
    PercentageLabel.Caption := LProgressStr;
  end;
end;

procedure TMainForm.UpdateProjectName;
begin
  ProjectNameLabel.Caption := FCurrentProjectName;
end;

procedure TMainForm.UpdateState;begin
  StateLabel.Caption := FStateMsg;
end;

end.