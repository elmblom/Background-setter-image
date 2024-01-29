$imageUrl = "https://raw.githubusercontent.com/elmblom/Background-setter-image/main/image.jpg"

$downloadPath = "C:\Users\Public\image.jpg"

Invoke-WebRequest -Uri $imageUrl -OutFile $downloadPath

Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
[Wallpaper]::SystemParametersInfo(20, 0, "C:\Users\Public\image.jpg", 0x01)