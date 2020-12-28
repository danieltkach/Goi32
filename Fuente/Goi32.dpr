program Goi32;



uses
  Forms,
  UNIT1 in 'UNIT1.PAS' {Form1},
  unit3 in 'unit3.pas' {AboutForm},
  uTesting1 in 'uTesting1.PAS' {TestingForm},
  Unit4 in 'Unit4.pas' {fmResults},
  Unit5 in 'Unit5.pas' {ConfigForm},
  uReadings1 in 'uReadings1.pas' {fmReadings},
  uJoinFiles in 'uJoinFiles.pas' {fmJoinFiles},
  uStartup in 'uStartup.pas' {fmStartup},
  uText in 'uText.pas' {fmText},
  uDirectories in 'uDirectories.pas' {fmDirectories},
  uTestedFiles in 'uTestedFiles.pas' {fmTestedFiles},
  uDescription in 'uDescription.pas' {fmDescription},
  uReportWindow in 'uReportWindow.pas' {fmReportWindow},
  uToKanji in 'uToKanji.pas' {fmToKanji},
  uMultipleChoice in 'uMultipleChoice.pas' {fmMultipleChoice},
  uRegistration1 in 'uRegistration1.pas' {fmRegistration},
  uCredits in 'uCredits.pas' {fmCredits},
  uUsersWindow in 'uUsersWindow.pas' {UsersWindow},
  uFillinthegaps in 'uFillinthegaps.pas' {fmFillinthegaps};

{$R *.RES}

begin
  Application.Title := 'Goi32';
  Application.HelpFile := '';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TTestingForm, TestingForm);
  Application.CreateForm(TfmResults, fmResults);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.CreateForm(TfmReadings, fmReadings);
  Application.CreateForm(TfmJoinFiles, fmJoinFiles);
  Application.CreateForm(TfmStartup, fmStartup);
  Application.CreateForm(TfmText, fmText);
  Application.CreateForm(TfmDirectories, fmDirectories);
  Application.CreateForm(TfmTestedFiles, fmTestedFiles);
  Application.CreateForm(TfmDescription, fmDescription);
  Application.CreateForm(TfmReportWindow, fmReportWindow);
  Application.CreateForm(TfmToKanji, fmToKanji);
  Application.CreateForm(TfmMultipleChoice, fmMultipleChoice);
  Application.CreateForm(TfmRegistration, fmRegistration);
  Application.CreateForm(TfmCredits, fmCredits);
  Application.CreateForm(TUsersWindow, UsersWindow);
  Application.CreateForm(TfmFillinthegaps, fmFillinthegaps);
  Application.Run;
end.
