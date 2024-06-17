# Initialize Git LFS
git lfs install

# Read large files list and track them with Git LFS
Get-Content large_files.txt | ForEach-Object {
    $extension = [System.IO.Path]::GetExtension($_)
    git lfs track "*$extension"
}

# Add .gitattributes to the repository
git add .gitattributes
git commit -m "Track large files with Git LFS"
