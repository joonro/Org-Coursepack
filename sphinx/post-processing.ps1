Get-ChildItem ("../html/Lectures") -Filter *.html |

Foreach-Object {
    (Get-Content $_.FullName) -Replace "Lectures\\../../../", "../" -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*</span>', '<span class="pre">*</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*\\\*</span>', '<span class="pre">**</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
    (Get-Content $_.FullName) -Replace '<span class="pre">\\\*\\\*\\\*</span>', '<span class="pre">***</span>' -join "`n"  | Set-Content $_.FullName -NoNewline -Force
}

echo "Image paths and escape characters for * are fixed."

cp ../Assets/Images/Org-Teaching/*.png ../html/Assets/Images/Org-Teaching/
cp ../Assets/Images/Org-Teaching/Quickstart/*.png ../html/Assets/Images/Org-Teaching/Quickstart

echo "Images copied to ../html/Assets/Images."


