param (
    [int[]]$ports 
)

foreach ($port in $ports) {

  $foundProcesses = netstat -ano | findstr :$port
  $activePortPattern = ":$port\s.+LISTENING\s+\d+$"
  
  if ($foundProcesses | Select-String -Pattern $activePortPattern -Quiet) {
    $matches = $foundProcesses | Select-String -Pattern $activePortPattern
    $firstMatch = $matches.Matches.Get(0).Value
  
    $pidNumber = [regex]::match($firstMatch, "\d+$").Value
  
    taskkill /pid $pidNumber /f
  } else {
        echo "Process $port was not not found"
    }
}
