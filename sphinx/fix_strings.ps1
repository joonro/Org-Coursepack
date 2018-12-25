Get-ChildItem ("../html/Lectures") -Filter *.html |

Foreach-Object {
    (Get-Content $_.FullName) -Replace "Lectures\\../../../", "../" -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*</span>', '<span class="pre">*</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*\\\*</span>', '<span class="pre">**</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*\\\*\\\*</span>', '<span class="pre">***</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
}

