; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#define MyAppName "NSMusicS"
#define MyAppVersion "1.5"
#define MyAppPublisher "Xiang Cheng (����)"
#define MyAppURL "https://github.com/Super-Badmen-Viper/NSMusicS"
#define MyAppExeName "NSMusicS.exe"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (��Ҫ�����µ� GUID�����ڲ˵��е�� "����|���� GUID"��)
AppId={{4F700ECD-5965-4B7A-953A-26800CF84D38}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=E:\0_XiangCheng_WorkSpace\NSMusicS\LICENSE
; ������ȡ��ע�ͣ����ڷǹ���װģʽ�����У���Ϊ��ǰ�û���װ����
;PrivilegesRequired=lowest
OutputDir=E:\0_XiangCheng_WorkSpace\NSMusicS\release
OutputBaseFilename=NSMusicS
SetupIconFile=E:\0_XiangCheng_WorkSpace\NSMusicS\build\NSMusicS.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\NSMusicS.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\chrome_100_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\chrome_200_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\ffmpeg.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\icudtl.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\libGLESv2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\LICENSE.electron.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\LICENSES.chromium.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\resources.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\snapshot_blob.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\v8_context_snapshot.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\vk_swiftshader.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\vk_swiftshader_icd.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\vulkan-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\locales\*"; DestDir: "{app}\locales"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "E:\0_XiangCheng_WorkSpace\NSMusicS\release\win-unpacked\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��

[Code]
var
  BackupDir: string;

procedure InitializeWizard();
begin
  BackupDir := ExpandConstant('{app}\..\NSMusicS_Backup');
  ForceDirectories(BackupDir);

  if FileExists(ExpandConstant('{app}\resources\navidrome.db')) then
  begin
    FileCopy(ExpandConstant('{app}\resources\navidrome.db'), BackupDir + '\navidrome.db', False);
    DeleteFile(ExpandConstant('{app}\resources\navidrome.db'));
  end;

  if FileExists(ExpandConstant('{app}\resources\nsmusics.db')) then
  begin
    FileCopy(ExpandConstant('{app}\resources\nsmusics.db'), BackupDir + '\nsmusics.db', False);
    DeleteFile(ExpandConstant('{app}\resources\nsmusics.db'));
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    if FileExists(BackupDir + '\navidrome.db') then
    begin
      ForceDirectories(ExpandConstant('{app}\resources'));
      FileCopy(BackupDir + '\navidrome.db', ExpandConstant('{app}\resources\navidrome.db'), False);
      DeleteFile(BackupDir + '\navidrome.db');
    end;

    if FileExists(BackupDir + '\nsmusics.db') then
    begin
      ForceDirectories(ExpandConstant('{app}\resources'));
      FileCopy(BackupDir + '\nsmusics.db', ExpandConstant('{app}\resources\nsmusics.db'), False);
      DeleteFile(BackupDir + '\nsmusics.db');
    end;

    RemoveDir(BackupDir);
  end;
end;

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent