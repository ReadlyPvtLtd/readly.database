# PowerShell Script to Combine All SQL Files into a Single Output File

# --- Configuration ---
$srcPath = "E:\readly.database\src"
$outputFile = "E:\readly.database\output.sql"
$fullContent = @()

# --- Execution ---

# --- File Gathering Order ---

# 1. Functions
$files = Get-ChildItem -Path $srcPath -Recurse -Filter "*.sql" | Where-Object { $_.DirectoryName -like "*\functions*" }

# 2. Procedures
$files += Get-ChildItem -Path $srcPath -Recurse -Filter "*.sql" | Where-Object { $_.DirectoryName -like "*\procs*" }

# 3. Objects
$files += Get-ChildItem -Path "$srcPath\tables" -Filter "objects.sql"

# 4. Tables
$files += Get-ChildItem -Path $srcPath -Recurse -Filter "table.sql"

# 5. Columns
$files += Get-ChildItem -Path $srcPath -Recurse -Filter "columns.sql"

# 6. Constraints
$files += Get-ChildItem -Path $srcPath -Recurse -Filter "constraints.sql"

# 7. Foreign Keys
$files += Get-ChildItem -Path $srcPath -Recurse -Filter "foreignkeys.sql"

# 8. Triggers
$files += Get-childitem -Path $srcPath -Recurse -Filter "*.sql" | Where-Object { $_.DirectoryName -like "*\triggers*" }

# --- File Processing ---

foreach ($file in $files) {
    Write-Host "Processing: $($file.FullName)"
    
    # Add a header to indicate the origin of the SQL commands
    $fullContent += "/* --- $($file.FullName) --- */"
    
    # Append the content of the SQL file to the output file
    $fullContent += Get-Content -Path $file.FullName
    
    # Add a separator for better readability
    $fullContent += "\n\n"
}

# Write all content to the output file at once
$fullContent | Out-File -FilePath $outputFile -Encoding utf8

Write-Host "All SQL files have been combined into: $outputFile"
