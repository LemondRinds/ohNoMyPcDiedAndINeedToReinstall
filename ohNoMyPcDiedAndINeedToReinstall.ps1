Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# wrap it all up so cron can run and update
function ohNoMyPcDiedAndINeedToReinstall {
  # setup a list of packages
  $toInstall = @(
    'vlc.portable'
    #,'mpc-hc' vlc better?
    #,'cccp' dead? comes with vlc?
    #,'k-litecodecpackfull' comes with vlc?
    ,'spotify'
    ,'teracopy'
    ,'discord'
    ,@('googlechrome','%ProgramFiles%\Google\Chrome\Application\chrome.exe')
    #,'chrome-remote-desktop-chrome' just use browser
    ,'parsec'
    ,'paint.net'
    ,@('notepadplusplus','%ProgramFiles%\Notepad++\notepad++.exe')
    ,@('vscode','%ProgramFiles%\Microsoft VS Code\Code.exe')
    ,@('steam','%ProgramFiles(x86)%\Steam\Steam.exe')
    ,'7zip'
    ,'node'
    ,'go'
    ,'git');

  # do a loop for installs
  $toInstall |% {
    # do things in the loop
    $name;
    $path;
    if($_.GetType().Name -ne 'String'){
      $name = $_[0];
      $path = $_[1];
    } else {
      $name = $_;
    };
    choco upgrade $name -y;
    if($path){
      # pin stuff later or something
    }
  };
}

ohNoMyPcDiedAndINeedToReinstall();
