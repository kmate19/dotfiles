function v { nvim @args }
function v. { nvim . }
function gwip { git add -A; git rm $(git ls-files --deleted) 2>$null; git commit -m $(Read-Host "Commit message") }
function gcl { git clone @args }
function gs { git status @args }
function gp { git push @args }
function gb { git branch @args }
function gl { git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n' @args }
function gu { git pull @args }
function gd { git diff @args }
function gf { git fetch @args }
function ga { git add @args }
function c { code @args }
function pn { pnpm @args }
function g { git @args }
function l { eza -lah --icons @args }

Remove-Item Alias:cd -Force
Remove-Item Alias:cat -Force
Remove-Item Alias:ls -Force
Remove-Item Alias:gc -Force

function cat { bat @args }
function gc { git commit @args }
function ls { eza --icons @args }
function cd { z @args }

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
