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
    ,'googlechrome'
    #,'chrome-remote-desktop-chrome' just use browser
    ,'parsec'
    ,'paint.net'
    ,'notepadplusplus'
    ,'vscode'
    ,'steam'
    ,'7zip'
    ,'node'
    ,'go'
    ,'git');

  # do a loop for installs
  $toInstall |% {
    # do things in the loop
    choco upgrade $_ -y;
  };
}

ohNoMyPcDiedAndINeedToReinstall();
