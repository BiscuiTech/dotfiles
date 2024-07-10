# Define the path to ffmpeg.exe
$ffmpegPath = "C:\Users\jhuet\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-7.0.1-full_build\bin\ffmpeg.exe"

# Get all .mkv files in the current directory
$files = Get-ChildItem -Path . -Filter *.mkv

foreach ($file in $files) {
    # Define the output file name
    $outputFile = [System.IO.Path]::ChangeExtension($file.FullName, "h264.mkv")

    # Build the ffmpeg command
    $ffmpegCommand = "$ffmpegPath -i `"$($file.FullName)`" -c:v libx264 -c:a copy `"$outputFile`""

    # Execute the ffmpeg command
    Write-Host "Converting $($file.FullName) to $outputFile"
    Invoke-Expression $ffmpegCommand
}

Write-Host "Conversion complete!"

