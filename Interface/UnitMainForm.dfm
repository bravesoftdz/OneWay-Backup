object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OneWay Backup'
  ClientHeight = 594
  ClientWidth = 1008
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TsPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 295
    Align = alClient
    BevelOuter = bvNone
    Caption = 'TopPanel'
    TabOrder = 0
    ExplicitWidth = 1043
    ExplicitHeight = 312
    object LeftPanel: TsPanel
      Left = 0
      Top = 60
      Width = 1008
      Height = 235
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 1043
      ExplicitHeight = 252
      object JobsList: TsListView
        Left = 0
        Top = 25
        Width = 1008
        Height = 210
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Project Name'
            Width = 200
          end
          item
            Caption = 'Source Folder'
          end
          item
            Caption = 'Destination Folder'
          end
          item
            Alignment = taCenter
            Caption = 'Buffer Size'
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = 'Ignored File Types'
            Width = 125
          end
          item
            Alignment = taCenter
            Caption = 'Compare Method'
            Width = 100
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = JobListMenu
        TabOrder = 0
        ViewStyle = vsReport
        OnMouseDown = JobsListMouseDown
        ExplicitWidth = 1043
        ExplicitHeight = 227
      end
      object ActivatePanel: TsPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 25
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 1043
        object SelectAllLabel: TsLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 54
          Height = 17
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Activate All'
          ParentFont = False
          Layout = tlCenter
          OnClick = SelectAllLabelClick
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ExplicitHeight = 13
        end
        object SelectNoneLabel: TsLabel
          AlignWithMargins = True
          Left = 64
          Top = 4
          Width = 66
          Height = 17
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Deactivate All'
          ParentFont = False
          Layout = tlCenter
          OnClick = SelectNoneLabelClick
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ExplicitHeight = 13
        end
        object SelectReverseLabel: TsLabel
          AlignWithMargins = True
          Left = 136
          Top = 4
          Width = 91
          Height = 17
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Reverse Activation'
          ParentFont = False
          Layout = tlCenter
          OnClick = SelectReverseLabelClick
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ExplicitHeight = 13
        end
      end
    end
    object RightPanel: TsPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      SkinData.SkinSection = 'TOOLBAR'
      ExplicitWidth = 1043
      object RunJobsBtn: TsButton
        Left = 788
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Run'
        ImageAlignment = iaTop
        ImageIndex = 3
        Images = sAlphaImageList1
        TabOrder = 0
        OnClick = RunJobsBtnClick
        SkinData.SkinSection = 'TOOLBUTTON'
        ExplicitLeft = 933
      end
      object AddNewProjectBtn: TsButton
        Left = 0
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'New'
        ImageAlignment = iaTop
        ImageIndex = 1
        Images = sAlphaImageList1
        TabOrder = 1
        OnClick = AddNewProjectBtnClick
        SkinData.SkinSection = 'TOOLBUTTON'
      end
      object StopBtn: TsButton
        Left = 898
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Stop'
        Enabled = False
        ImageAlignment = iaTop
        ImageIndex = 4
        Images = sAlphaImageList1
        TabOrder = 2
        OnClick = StopBtnClick
        SkinData.SkinSection = 'TOOLBUTTON'
        ExplicitLeft = 942
        ExplicitTop = -6
      end
      object EditProjectBtn: TsButton
        Left = 110
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Edit'
        HotImageIndex = 0
        ImageAlignment = iaTop
        ImageIndex = 0
        Images = sAlphaImageList1
        TabOrder = 3
        OnClick = EditProjectBtnClick
        SkinData.SkinSection = 'TOOLBUTTON'
      end
      object ConfEmailBtn: TsButton
        Left = 320
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Email Options'
        ImageAlignment = iaTop
        ImageIndex = 2
        Images = sAlphaImageList1
        TabOrder = 4
        OnClick = ConfEmailBtnClick
        SkinData.SkinSection = 'TOOLBUTTON'
      end
      object DeleteBtn: TsBitBtn
        Left = 220
        Top = 0
        Width = 100
        Height = 60
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Delete'
        Layout = blGlyphTop
        TabOrder = 5
        OnClick = DeleteBtnClick
        ImageIndex = 5
        Images = sAlphaImageList1
      end
      object PreviewBtn: TsButton
        Left = 678
        Top = 0
        Width = 110
        Height = 60
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Preview'
        ImageAlignment = iaTop
        ImageIndex = 6
        Images = sAlphaImageList1
        TabOrder = 6
        OnClick = PreviewBtnClick
        ExplicitLeft = 823
      end
      object SendEmailBtn: TsCheckBox
        Left = 436
        Top = 20
        Width = 127
        Height = 20
        Caption = 'Send email when done'
        TabOrder = 7
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object BottomPanel: TsPanel
    Left = 0
    Top = 295
    Width = 1008
    Height = 299
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 312
    ExplicitWidth = 1043
    object StateLabel: TsLabel
      AlignWithMargins = True
      Left = 4
      Top = 195
      Width = 1000
      Height = 13
      Align = alBottom
      ExplicitTop = 207
      ExplicitWidth = 3
    end
    object ProjectNameLabel: TsLabel
      AlignWithMargins = True
      Left = 4
      Top = 176
      Width = 1000
      Height = 13
      Align = alBottom
      ExplicitTop = 188
      ExplicitWidth = 3
    end
    object ChangesLabel: TsLabel
      AlignWithMargins = True
      Left = 4
      Top = 214
      Width = 1000
      Height = 13
      Align = alBottom
      ExplicitTop = 226
      ExplicitWidth = 3
    end
    object SpeedLabel: TsLabel
      AlignWithMargins = True
      Left = 4
      Top = 233
      Width = 1000
      Height = 13
      Align = alBottom
      ExplicitTop = 245
      ExplicitWidth = 3
    end
    object TimeLabel: TsLabel
      AlignWithMargins = True
      Left = 4
      Top = 252
      Width = 1000
      Height = 13
      Align = alBottom
      ExplicitTop = 264
      ExplicitWidth = 3
    end
    object PercentageLabel: TsLabel
      Left = 1
      Top = 268
      Width = 1006
      Height = 13
      Align = alBottom
      Alignment = taCenter
      Caption = '0%'
      ExplicitWidth = 17
    end
    object LogsPages: TsPageControl
      Left = 1
      Top = 1
      Width = 1006
      Height = 172
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 1041
      ExplicitHeight = 184
      object TabSheet1: TsTabSheet
        Caption = 'General Log'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        ExplicitWidth = 1033
        ExplicitHeight = 156
        object LogList: TsListView
          Left = 0
          Top = 0
          Width = 998
          Height = 144
          Align = alClient
          Columns = <
            item
              Width = 125
            end
            item
              Width = 500
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          HideSelection = False
          OwnerData = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          ShowColumnHeaders = False
          TabOrder = 0
          ViewStyle = vsReport
          OnData = LogListData
          ExplicitWidth = 1033
          ExplicitHeight = 156
        end
      end
      object TabSheet2: TsTabSheet
        Caption = 'Error Log'
        ImageIndex = 1
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        ExplicitWidth = 1033
        ExplicitHeight = 156
        object ErrorLog: TsListView
          Left = 0
          Top = 0
          Width = 998
          Height = 144
          Align = alClient
          Columns = <
            item
              Width = 125
            end
            item
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          HideSelection = False
          OwnerData = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          ShowColumnHeaders = False
          TabOrder = 0
          ViewStyle = vsReport
          OnData = ErrorLogData
          ExplicitWidth = 1033
          ExplicitHeight = 156
        end
      end
      object TabSheet3: TsTabSheet
        Caption = 'Full Log'
        ImageIndex = 2
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        ExplicitWidth = 1033
        ExplicitHeight = 156
        object FullLogList: TsListView
          Left = 0
          Top = 0
          Width = 998
          Height = 144
          Align = alClient
          Columns = <
            item
              Width = 125
            end
            item
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          HideSelection = False
          OwnerData = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          ShowColumnHeaders = False
          TabOrder = 0
          ViewStyle = vsReport
          OnData = FullLogListData
          ExplicitWidth = 1033
          ExplicitHeight = 156
        end
      end
    end
    object ProgressBar: TsProgressBar
      Left = 1
      Top = 281
      Width = 1006
      Height = 17
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = -2
      ExplicitTop = 282
    end
  end
  object SearchSourceFiles: TJvSearchFiles
    Options = [soAllowDuplicates, soSearchDirs, soSearchFiles, soIncludeSystemHiddenDirs, soIncludeSystemHiddenFiles]
    DirParams.MinSize = 0
    DirParams.MaxSize = 0
    FileParams.MinSize = 0
    FileParams.MaxSize = 0
    OnFindFile = SearchSourceFilesFindFile
    OnFindDirectory = SearchSourceFilesFindDirectory
    Left = 168
    Top = 160
  end
  object OperationThread: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpIdle
    StopMode = smTerminate
    OnException = OperationThreadException
    OnRun = OperationThreadRun
    Left = 273
    Top = 105
  end
  object SearchDestFiles: TJvSearchFiles
    Options = [soAllowDuplicates, soSearchDirs, soSearchFiles, soIncludeSystemHiddenDirs, soIncludeSystemHiddenFiles]
    DirParams.MinSize = 0
    DirParams.MaxSize = 0
    FileParams.MinSize = 0
    FileParams.MaxSize = 0
    OnFindFile = SearchSourceFilesFindFile
    OnFindDirectory = SearchDestFilesFindDirectory
    Left = 168
    Top = 104
  end
  object Taskbar1: TTaskbar
    TaskBarButtons = <>
    ProgressState = Normal
    TabProperties = []
    Left = 392
    Top = 112
  end
  object JobListMenu: TPopupMenu
    Left = 488
    Top = 100
    object O1: TMenuItem
      Caption = 'Open Source Directory'
      OnClick = O1Click
    end
    object O2: TMenuItem
      Caption = 'Open Destination Directory'
      OnClick = O2Click
    end
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 792
    Top = 76
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 712
    Top = 84
  end
  object SpeedTimer: TJvThreadTimer
    OnTimer = SpeedTimerTimer
    Left = 256
    Top = 172
  end
  object PassedTimeTimer: TJvThreadTimer
    OnTimer = PassedTimeTimerTimer
    Left = 336
    Top = 172
  end
  object sSkinManager1: TsSkinManager
    Active = False
    Brightness = -10
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'Tahoma'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'H:\delphi\Skins'
    SkinName = 'Office2007 Black (internal)'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 512
    Top = 180
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    FormHeader.AdditionalHeight = 0
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 605
    Top = 169
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 752
    Top = 152
  end
  object sAlphaImageList1: TsAlphaImageList
    Height = 22
    Width = 22
    Items = <
      item
        ImageFormat = ifPNG
        ImageName = 'document-edit'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793
          0000000970485973000009840000098401AAE263790000000774494D4507D80B
          11171526511DE315000003A54944415478DAADD37F48DC751CC7F1E7F7EB1DBA
          3BD01A38BC2E246594963474B5E1FEA988281B52CEFE50ECC71FA5C95C494484
          35E6961405DB2207E94AC4AD24D47FD664CD66D10F6B44D3D936B6D87431E5D4
          F3CEBBFB9EE7FDFADE7DBF9F76C7E9751C1E16BDE0CDE7F3E5C3F7F17D7FDFF0
          91F81F72B5EED927C39EE02919CE85ADD6969DBDBDB655780B50C27FC8BE3DF2
          96832F597BECBD77E7AE5C59942E6BDAAC3318AC34403C3B8410C3FCCBA8FE79
          FCE3BB99BCB648DB0D27FB1C0E36472285FE48E4ED5558BA0DE3703A91240959
          96636B6A0124F6007A6485E8D53A16169678EBB89979CF0ADF3DECD76A029234
          7B01874C3229A89C5A48B21C3F8BEFD151AFBF4EC03BCB6B9D39B89408F75B1D
          5ADBCBB2083C65F8F2635DFF69B56301C45E4CED368192EC3ABE06AE1FC01899
          A6A5CB8CCD1126DFE4E0480BD2CD85ACB18643EA086033ACD7ADB4CE38FCB73E
          2747FD9DB65E0397A6FC644B2E3A5B3514BF71BAF6DDF029601A98491D45128D
          AD69A53A463005CED2736613DF9EF722693E8E34FB31E759D8F38E3A11569901
          2601F14F38054DFCC15A45BC7F60508618FECD44D7C02C425739F8A287E2C23B
          F86AFC713C3EE104468128400A9C8A2647A10566C872F671F186910F3E9B42D7
          345A9F71B26B5B0EC77FD84954DA0CF02BE007488793E8DAAAAB6EF4F96EA66C
          82373EBC4C3018A2E13117B58FCA1CFBA604BB3797868606926806584A8C4468
          2134DB3196BC82D6F7C759F6F979A2DCCBDE1A954FCFDCC5E44D33F5F5F59495
          9591481A2CD260A113BEF5098190606FFB2FCC2FFAA8D81A60FFF32B7C319ACB
          D7E7B3A9AEAEA6AAAA6AEDD26CA8E3E05F87119A97D643A34CCF7829B6A87CF4
          8AC2B971234707652A2B2B696C6C0440D7F534D8900227F0D08A0B9FB24047E7
          8F4C5C8B909F17E568B39B3F67245A0E07B9F7BE629A9A9A501485C4C5DA58C7
          81650701E32E8CA6424CD97A1C45CA66FF490B75F52FD0DFDF4F454505168B05
          B3D9C4D8D8CF0AE058B76312B35216AFE0735DA2E611C1D3DB3751FE8005FF3D
          439CDC26535A520A801082E5652FA7878795F603EDCDC078C6512CDAE7B93831
          86F5CE25E42C135B1F7A13ADB48A3C733E3ED596820E0C0E2A1DEF75BC3A3737
          37040848CF6E713BA15048F4F5F688EDE50F8AB1B3DD22E073094DD384AEEB22
          1A8D0A9BCD167FF678DCA2BBBBCB5D5050F01C20919A74381C0E8BEF4747C4D2
          922306C52A0D8EA1274EF4B9AD566B12CD08674EFC0376BB5D0C0C0CB88B8A8A
          6A33A3C9C34260071BCB2C70011064C8DF4157E8D7666372410000000049454E
          44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'list-add'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000473424954080808087C086488000000097048597300000DD700000D
          D70142289B780000001974455874536F667477617265007777772E696E6B7363
          6170652E6F72679BEE3C1A000003084944415478DAAD94CD6B9C5514C67FF7EB
          7D67F29D3193B48A20B4D0D0964954BA29D21A04154B41176E1544C4B52BDB4D
          B3E8B2EE04C13FA085AC4AB5AEAAD08268CD4A838BD806626A4A324CD3662633
          EFE7BDD7E93BDD66B2983C9707EEB98B1FE73C1CAEF0DED34FEFFD70E6FDF3AF
          BCF3DDADF51BAF054A45B5A937966B2FBDF9F517B3977EA38F340768488DDCF8
          6AEECAC4A9C939C0951DEEDC9364EB26F02A90B28F240768A3B53EF1FBD63D2A
          15C94405A64A33DCAFDF9D06F2813AB6DED3CA76D96BFF0B40D58FF2DF5E7177
          83819DEBDAD2C9925E2D2DB9EB3107023BE7B138DA690C401E5AACF387017645
          1CBD8E0579D0AD0FEE18494F4780D1FD32F6DE91E419699EE29CC5EDDFF1E80B
          16FAEAAF57CF9F9E3E7DEBDAF2B5B1959DBFD052A284442B59DCC7C211529B12
          6731520862176354C8B99B277CA0145A2B02D5F3F1F159168E5EDC799A6D5FD4
          6B4FD7BEB97CF6F298F339F5680B0F08E929243C420872523AB60340E6123E99
          FD122514B26BF5C2437A1885642F6F54EE6DFDB8A8AFAF5C3F39375DA3916EB2
          F17CA51420412B8194122D244E58AC4B9102EE37EE6284C679086589113341A3
          FD8C95C7ABEC365B7C7EF6431AF1F65B3ACD52FED9798093319D2C06075209B4
          EBC5E1BB068F5186400504B26B1192D89447CDC7FC5DFF99DDA84D27C9983147
          BB8C4EB18E82456ECFBF3CFF416DA6865212A515C668CA26C44883942084E38F
          FA1D9C4839537D1BBC04C03F3F0EAC7738EF0995A2E937D98C1EFE24B8C23124
          B78D3627945120292CA54049C97050E2C2F1777914FF49680CC7CAAF7367E317
          10793191915D2B55582981927E35D0FA82F68B7E0D98651F8D7F3BECA33C2A20
          25AD487C44DCAD1F7C5A17FDF7B8BF8ABCDA59BB98402B41E2E2E20D60107091
          DF5EBA4766731090D8E870FE0AEB2CCDA48522424981C85B5DB03D9C4FE849A7
          898BDBB4E28450E48711C5F77A2A1C62525BB69B6D36769EE1D3905256666161
          410E009EB4F35393CD539510EF3DCA6B66CC11425B5EAF56AB7E00F0C75EBBEC
          B387BBF16AE25284949121581EB5E31F2D2D2DF505FF0FA0866EC2485BD0E600
          00000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'configure'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793
          000000097048597300001BAF00001BAF015E1A911C0000000774494D4507D901
          0403322DE10EEFFD000003CD4944415478DA9D936B4C936714C7CFDBF66D29A3
          D295444A6955708B09ACB423236386B976A33323CB5CC2305B362F21202EDB90
          F5A2365984C41B51DCB2019B929852343126049B08D80251543ECC812658191A
          1DA064D6AE17E84A97B5EFE5D9C184C40F33B63DC93F7972CE3FBFF7BCE73C0F
          05A90765B55AF42693A9313333B39CE3397134FAF783502878DEE1709EBD3A7A
          2D01E9409B9B0FD4FA9EF8121CC79248244266E766C9CD5B13A4EF422F6FB17D
          DB8E1E51CAD4772B8DEB2FB907FF09040324FE6F9C2CC596486BEB51AEACEC8D
          FB344DFF809637514248952E7B296B4B76B64CCA711C306C02288A8241B7FBCC
          F8F8841DCB0114BBE215A4C015CA5F96BF35333307841060180658FC804AA99C
          C6DA9315683A6069515151D9F4F4EFC0B20C8A05966161DBF66D956BD7ADA59F
          359AAD4DD9C264A96F6FAA78ADAAAACA160C8628698614542A15E0022123535A
          88E3D958AC2D1A6D6C6C5CDFB0BBE1D0C2C2E2E1643BA60C06C38708A3F2F3F3
          A1EF820B8E1E6BC3AE112C91805AAD792F4322BDBBE1D50D13AA3C55EDF56BD7
          1792054BB45A6DF5833F66A1CFD50FFAD252E877BBE1B6D70B4000341A0D6465
          654969094DFD7AE3063B34347C2E1930D5D2D25CA3D7E94BB4C5C5F0A7CF0742
          81000A0B0AE07C6F2FF03C0F72B9FCE90DB977F71EB1EFB37B30774EF4226867
          67C767E5E5E5A7FC7E3F60D7F0C166D3F2158375EA7CD0EB4A402C114320E087
          7028CC7CDEF2C5402291B00380FFB94FBA44A7155ACCE6EF84B4F8C019678F60
          31B208C78F1D0735021FCD3FE2BB4E75C57C8F7D2102303F36363689F31E0700
          0FEA2F14F9DF8E1B76D7CB36BD6370DCF1DEA9F6783C90A3C8C139AE01659E92
          EFECFCF9B7F6F6F68BD8D94DB4CEA282A825148322F0BCB058CDAF387B1C935B
          3EFE8868D668884EAF2346A3910C0E0EF07B9AF6F4A2A510257CE1629E3DDBF6
          5A361714169C7576F7E4CCCD3D04112D8255B255B073E70E5C12B96ADF6FAF45
          DF0C24112BA3A0CD96268B224771F0E4C92E51301002016E9E6339D0BDAE0385
          4271BFBE6E97EDE9AF271922A53257F2F5375F76ACCE55D64D4D4D61873248C4
          13108BC570516A78BFD214B25A6C7BD17B0B4592050B2C36F33E96E3B7763B9C
          FBC3E1F0275B3FAD995FBE97F8C27004DBE327DABE3F8CF94BE8E5209570384F
          7B2B2A360EE3518EA2DA4EB47EB5ABA19EFCD4F12367341A3A30970D69844022
          9644957979B9785E9630CE30AB4B4BF5E4F2C888EBCA95D123988BA4031645A3
          D15F6A6AAA1D1A8DFA3425A01EE28CAB47462E0FB85C17AD587F0C690685121C
          3A727007C324EA7061D4ED496FFF9067B81BF33E144917FC1F0D858C2FADA03F
          120000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'folder-activities'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160803000000F36A9C
          090000000373424954080808DBE14FE000000009704859730000026100000261
          01C13055FA0000001974455874536F667477617265007777772E696E6B736361
          70652E6F72679BEE3C1A00000192504C5445FFFFFFFFFF800040000033000080
          00005500004D00005D00004900005C00005C0000560004550403520303500305
          4D05085208074D070646060645062477240644060B690B136713126812106B10
          065D060758070A550A086808094B090C6C0C0A480A0C440B11470C1F721E0F79
          0D1F771F1D7A1D1B7B1A177E16127E101E6D1E0B790950A04E1283103686313B
          8D31267B1D30581D32782537792A3E6E29427A32436C2A4B7B3A40AB0D44B010
          466D2B49BC0F4A712A4AC00F4BC00F4EAF2151B72152B52353D11157BB1A599B
          395DB12D5FB444609B3C60A24461CF1C62B84463B44565A84965AB4E65B05366
          9739669A3D67B45367B55368AD4D69B8536AB42D6ABB4B6BB5496DB1626EB462
          6F9D3B6FB56270B25970B86371B25671C22F74BE5777B75F77C65378B87178D0
          307AA83E7ABB727ABE657EC64E80C17481C45A83BC5583C08184BD5685C28286
          C26888C05F8AC3658AC3728AC7838BC4758CC1688CDF3A8DC36B90C65791CD91
          92C17392C27192C47393C27694C57095D09197C87E99C97C9ECF86A1CF86A4E0
          A2AEDA96CCCB5ED70000003874524E530002040506090A0B0E24273B454B535D
          636E788181878F959AA0A2ADB6BFC1C6CBD5D6DCDFDFE1E4E7E9EDEEEEF6F7FA
          FBFBFCFDFEFEFEFE7DE2E059000000B64944415418D36360A01FE050D1E1C214
          65D76C6AD5E5441765D368686969D686F2C4442034AB7A4D7D6565A31E84271F
          932809A259D4CA8BF3726A0DB8C1A2B2BE2545C1120C0CCCAA859969C955463C
          10C5FAA511D1F93EE24CCA05E9B191D5C6BC5093A55CE2FC82B23CB4B2134202
          EB4CF9E0F64BBB87BB796554248579E79AF323B94B26C0D5DED1C1D222D44400
          C5BD72FECED676B6F1668268FE5088F2744AB112C2F0B5526A998D306660302A
          1A8AD2293600433023CD49C5B9400000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'dialog-cancel'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000000097048597300001BAF00001BAF015E1A911C0000000774494D4507D7
          0A1A122820CF6AD01100000006624B474400FF00FF00FFA0BDA793000004CC49
          4441541819A5C17B4CD4050007F0EFFDEE7E77DC218FBBE380134550D4924331
          0BC49C87C4A94821E783974B22240903C4077350E20B017948289AE0D425BED0
          2830287C804ABCD500F130D4746D29B9CAB5FE7099F94D36DDD8E5CCD5E78317
          F136806D6AB5F4909797180F48F07FEC07A4752A5558474848C58DFCFCEB0355
          55F77F6D6A7AF0536DEDDDEF0B0B4F75CC9D9B5A377CB8162F2A14401510D8E8
          63E8ED4D4DE1ADD21DBC5150C0EBF9F9BC9697C7FEDC5CF61714F0EAA64D6C36
          1A7FAB1184F43D8014CF1307E0B85C5CDD1EB1F0617F5E1EAF6667D3B271032F
          BEB7942DE6796C7E2B946D3151FC76CD2A766766B22B23839D094BF9A54E7BB2
          02B0C7B338033828CA52DB962C66EFBA75ECC9CC60E31C138F691C5A2A80B4FD
          40F03EC07800883D2C178FD44DF4FEA325219E6DC9C96C5D96C0CF75DAC69D80
          1CD6CA01BF53A6C00797D2D3D9B9229955633D7E2E03CCF30109AC94032E4775
          EAEF1A1747F35C7C3CCFC6C5B1317A112B4469EE6B182216901C74736E6E4B5E
          CED6E549AC1CE771AF18988467A836995C3F1B3FBAB771D17C36C4C4F0547434
          EB2323591F11C16AFF571EEC04BCF0541130B526E8759E8B8FE709D30C1603EF
          BC817F6A4C4BD3B7A7AFB0B4442DE479B3990DE1E1FC3A2C9447278F674D6828
          BF8A9CCF3251D886A7B6C984BCFA28334F4647B17C84F6FA1240062B4D9B37EB
          2F97E4F7754698D91A12C2A6D9B37966EE2CEE7573FAF163A9E458A5712A8F9B
          4CACF01E7333189060D07657FB33B5E6793C11369B7932A11856EA5252F4DDC5
          B9962EF39BBC1818C876A391DFCC0AE21E77DDED0DC0846C60FABE973D596932
          F1C014EF4799800BA6002819A5EDAB32995819E8C7F5401286D837678EFEFCCA
          24CBE59020F6F8FBB3CBCF8F17828D2CF370BE9D0178E3B164C0A9D44DC31C3B
          3B6EB597310BF0C5440039CECAAB453A1DCBBCF4CC0096E3893580BE7C8287A5
          67863FFB7C7DD9E7E3C3EE57277197A7CBED5580379E48049C0A1D446E0298EB
          20722D301983B2B4F2B39BA5129638885C2B0A25782C05D06F75142D4DB63276
          01BC02B0472965B15ABCF30160C010AB808062B5C81C805BD4E2A365801E8352
          45A1A8402D72BB20E1469DE2E6526064B65AB49CB593B10B603FC07E9594451A
          F99D04C0002B6B442177B75A64BE04DCA093FFE0030818140B18735C142C05B8
          CB55C18F34E22FF5F632B603B400BC662B65BE937C600960809538C035CF5571
          AF5C029668E44C55083BF19401105668E51777ABA4AC904958ED28B201E00580
          BDC364DCE2AC1888047C60651160B3DA513C7DD851E41E80D97A9B3F63006F0C
          650602B3DD950F2B246035C006806D763266B92806C2011F5889043CD3B4F273
          C79D153C0AB0CCD586714AE98E91B0A201B0402EACDBE1A9E21712F034C01A4F
          15535D6DAE644C0B482D4D4898B977E5CA699F24262EDE121CF0E976CF61F7CF
          A845D6023CA453305123EF9801D8E259DC01214C2164178EB67D7452296533C0
          2EA59417C66AD81A308E6D46033B278F648FCE861D001B24E0217715DFD5CA5B
          67023A3C8F1B804020FCFD11CA5B073C54EC7014D90DD002B00F602FC04B0A81
          75EE4A6679A8EE87CA855C5FC0062FCA1B504E076217E814B51F1A7477CB03C6
          3C3C1264F8AB2460F4EF492F693B82A492F5FE80BB23FEA36100F4806CAC2038
          4C1245CD7040E1847FF737F4D501346D01638F0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'list-remove'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000473424954080808087C086488000000097048597300000DD700000D
          D70142289B780000001974455874536F667477617265007777772E696E6B7363
          6170652E6F72679BEE3C1A0000016F4944415478DAED94C14A02511486FF3BE3
          88058A89A12E5AB50862DA08AE12A2459BA217F051DC056E445AF50AD2030481
          BB76B995DC24213A48E3C62C48CD1C674EE74E97C18856D126E6C2C7B9E70EF7
          9BC33F308288F0174B63427128FE599C65E2BF70C57D875A11067795CA41D234
          AFEE6BB5C4B4DD96873E06A33341AFAABEDA2BD64C13EBA5D2580C06A7B16AF5
          D6173F77BBE77BE57282E673CC6D5B5EF411AA6A4410B232422117117D565D07
          6532F02C2BE5D4EB672C3EF2C50F9797BB9BF93C96FD3E9696154C2321295778
          4A4A722F04B46C166F9E07BBD7C3E37088C36211C2B6F78328168B055E3A1D44
          6633D904939242B0448F46A131724A972774A6533C351A188F46780540B91CDC
          C904DA6AC61E7063379BC71B9C53349DE6D308045F162CF258E4F154EF1C9360
          642C705D201643AA504012DCAAA844AB05975D907B39C18510DB3A701D358C1D
          8385C147F9CE97673A11829E5FAE3B4E87FB932DA26EF8770BC5FF41FC0113D1
          8AE805384BF30000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'document-preview'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000000473424954080808087C086488000000097048597300000376000003
          76017DD582CC0000001974455874536F667477617265007777772E696E6B7363
          6170652E6F72679BEE3C1A000003D74944415478DAB5955D485B6718C7FFE7E4
          9C93734C6DE207619D542D6DF7A1DDA86CABCAFC608EAD37658A3742ABD0C1A0
          0803D956572CC34BC13B2F7633589DE0DDD6A176B021832588D346DA745DCBE6
          C0A05BCC686A8CF9D07C9DE4BC7BCE2B0976691C63EC1FFE3CE43D87DFFB7CE4
          7D2330C6F07F4820D791EBF1DFB44109FE8E03924CB07F33E01645018220623F
          0A144598CAE57290659967400F0AF1A02A1C8E4E0A4560C1841C04DFFFE9BEB9
          084992F028B805A7B31A300CA8AA8AC6C606A018CEBFFC1DCC61267C7B7B1B0F
          1E3C442C69E06BD70E82E13824AB8C5C761DCF56D9D1D3568EAD50082DCDE750
          66B3A148C5609197FFE3E2220211159FCFADA1F1CC73B878A5033A816D16115E
          CF1A3E9D5B454FAB037BBB3FA0BBFB9DFDAC193B1C7C6BEE1674A610D487AE0B
          ED68EE780175C71D081A02EA64068D323E73F604BEF9720175CFD8E072BBF166
          5717873F4D2299671B0E6FE3DBDB099C7EE97934BE7612CA51158F734096B25D
          CD00502554D554A2FD420B167E4BC1EFF7F384C8A5C17A26C3FBBFF1670CAFBE
          F13214BB0AED88027B990C551161D76454D04652B98AEAE3D5D0CB3408E647E0
          2EDD8AC75B5B50AC0A0CA4A1955BA16926D0028D56EC9285F7513700D16A41CA
          A6E048A503921CC9434B836B6A6A904EA5517BCC0E0B95AE5A25A814CB2401D6
          FD6621230A30C0A0D0B3DA6A0DC960F250B048E607803186D7CF1E433AAD7390
          6411A071B819690302538061183861978B5A5172780D0D2FA2BE2A8AD8C335C4
          E32964CDD2695D15CDB9991820CB04C8616ADBEE265A5B5B90576930B98B7E3A
          3BE11DF49CB3C111DAA2C39144981A1BCF01319D2194D2A111B43E1BC2C953A7
          108D46A1EBFAA1C32B9474F9DDCBB8F9D54D545446519BB6E2912F8780AC4013
          0D1CCD24100AACC3ED72C14A831EFAE0432C2D2DA1A9A90924F6B4DBAD736F6F
          CF4D77032F5DA4E8F3F9E0F1AC602F91E4BD07181C763B9AE928C762314C4D4D
          21994CE2DAC8750436FDB98F8787DFF2783C2E3C290E66F4224BA7D32C93C930
          2A9165B3596EBADD180D8CDBEBF59A91BF3B3636C6FAFBFBD91D5ADBD8D8D81D
          1D1D7DC54C226FB1705315F7EA89FE1190861A87294551D0D9D9A15342DF7F71
          E3067EF975D5F6D1D5AB1EDAECEDA2E1719786733055C4B35959F1E82323D7BB
          676666CE472291CFBC77EF607676D6323838F8DDF8F8F840A1C78944C29D3FF7
          7910C5824DA552292CD2EDA7AAD6D4D0D0FBE7BDDE9F17F29B0F0C0C8CB7B5B5
          0DD33B425F5F1F9B9C9CBC22F2C9FCB378A6C1603070E9527F3B871ED0F4F4F4
          B5E5E5E54F9C4E676E6262224433B8FD6FFFF3FEA00DD65142BDBDBDEF51DFEF
          CDCFCFDFFD0B6431A8F07FEC5E6B0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'format-justify-left'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000016000000160803000000F36A9C
          090000000373424954080808DBE14FE0000000097048597300000DD700000DD7
          0142289B780000001974455874536F667477617265007777772E696E6B736361
          70652E6F72679BEE3C1A00000042504C5445FFFFFF5050507878784F4F4F7777
          774F4F4F636363777777E0E0E0E1E1E1E3E3E3E5E5E5E6E6E6E8E8E8E9E9E9EA
          EAEAEDEDEDEEEEEEF3F3F3F8F8F8F9F9F9FCFCFC398AF0C80000000574524E53
          008080B4B482A2B723000000594944415478DAA5D05B0E80300844515A10F1AD
          A8FBDFAA09890DF8677B367033033F511F1118BECDA9C7360D22C260B08B102A
          6497CB604AF2D27DB65C915C2E4125F2EB625257CB79E8D73526BF617E7F5D46
          BF13DB6F7D00AD6F0563A669CFE70000000049454E44AE426082}
      end>
    Left = 600
    Top = 108
    Bitmap = {
      494C010100000800080001000100FFFFFFFF0400FFFFFFFFFFFFFFFF424D7600
      0000000000007600000028000000040000000100000001000400000000000400
      0000000000000000000000000000000000000000000000008000008000000080
      8000800000008000800080800000C0C0C000808080000000FF0000FF000000FF
      FF00FF000000FF00FF00FFFF0000FFFFFF0000000000}
  end
  object ProgressTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ProgressTimerTimer
    Left = 424
    Top = 184
  end
end
