# Update-AUPackages
$(
    $au   = gmo au -ListAvailable | % Version | select -First 1 | % { "$_"}
    $pno  = $Info.result.all.Length
    $GitHubUserRepo = $env:github_user_repo
)

[![](https://ci.appveyor.com/api/projects/status/github/$GitHubUserRepo?svg=true)](https://ci.appveyor.com/project/$GitHubUserRepo/build/$Env:APPVEYOR_BUILD_NUMBER)
[![$pno](https://img.shields.io/badge/AU%20packages-$($pno)-red.svg)](#ok)
[![$au](https://img.shields.io/badge/AU-$($au)-blue.svg)](https://www.powershellgallery.com/packages/AU)

_This file is automatically generated by the [update_all.ps1](https://github.com/$GitHubUserRepo/blob/master/au/update_all.ps1) script using the [AU module](https://github.com/majkinetor/au) ( [view source](https://github.com/$GitHubUserRepo/blob/master/au/gist.md.ps1) )._

|||
|---               | --- |
**Time (UTC)**     | $($Info.startTime.ToUniversalTime().ToString('yyyy-MM-dd HH:mm'))
**Git repository** | https://github.com/$GitHubUserRepo

$(
    $OFS="`r`n"

    $icon_ok = 'https://cdn0.iconfinder.com/data/icons/shift-free/32/Complete_Symbol-128.png'
    $icon_er = 'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-128.png'

    if ($Info.error_count.total) {
        "<img src='$icon_er' width='48'> **LAST RUN HAD $($Info.error_count.total) [ERRORS](#errors) !!!**" }
    else {
        "<img src='$icon_ok' width='48'> Last run was OK"
    }

    md_code $Info.stats

    if ($Info.pushed) {
        md_title Pushed
        md_table $Info.result.pushed -Columns 'PackageName', 'Updated', 'Pushed', 'RemoteVersion', 'NuspecVersion'
    }

    if ($Info.error_count.total) {
        md_title Errors
        md_table $Info.result.errors -Columns 'PackageName', 'NuspecVersion', 'Error'
        $Info.result.errors | % {
            md_title $_.PackageName -Level 3
            md_code "$($_.Error)"
        }
    }

    if ($Info.result.ok) {
        md_title OK
        md_table $Info.result.ok -Columns 'PackageName', 'Updated', 'Pushed', 'RemoteVersion', 'NuspecVersion'
        $Info.result.ok | % {
            md_title $_.PackageName -Level 3
            md_code $_.Result
        }
    }
)
