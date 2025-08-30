#!/bin/bash

# Script to download all PNG files referenced in ALL HTML files throughout the repository
# and update HTML files to reference local files instead of external CDN URLs

echo "🔍 Starting comprehensive PNG download and URL update process..."
echo "📁 Working directory: $(pwd)"
echo ""

# Create assets/images directory if it doesn't exist
mkdir -p assets/images

# Find all HTML files in the repository
echo "🔍 Scanning all HTML files for PNG references..."
html_files=$(find . -name "*.html" -type f)
echo "📊 Found $(echo "$html_files" | wc -l) HTML files to scan"
echo ""

# Extract all PNG URLs from all HTML files
echo "🔍 Extracting PNG URLs from all HTML files..."
png_urls=()

while IFS= read -r html_file; do
    echo "  📄 Scanning: $html_file"
    
    # Extract PNG URLs from this HTML file
    urls_in_file=$(grep -o 'https://[^"]*\.png' "$html_file" 2>/dev/null)
    
    if [ -n "$urls_in_file" ]; then
        echo "    ✅ Found PNG URLs in $html_file"
        while IFS= read -r url; do
            # Add to array if not already present
            if [[ ! " ${png_urls[@]} " =~ " ${url} " ]]; then
                png_urls+=("$url")
                echo "      ➕ Added: $(basename "$url")"
            fi
        done <<< "$urls_in_file"
    else
        echo "    ⏭️  No PNG URLs found in $html_file"
    fi
done <<< "$html_files"

echo ""
echo "📊 Total unique PNG files found: ${#png_urls[@]}"
echo ""

# Initialize counters
downloaded=0
failed=0

# Download each unique PNG file
echo "🔄 Starting downloads..."
for url in "${png_urls[@]}"; do
    # Extract filename from URL
    filename=$(basename "$url")
    
    echo "🔄 Downloading: $filename"
    
    # Download the file
    if curl -s -o "assets/images/$filename" "$url"; then
        echo "  ✅ Downloaded: $filename"
        downloaded=$((downloaded + 1))
    else
        echo "  ❌ Failed to download: $filename"
        failed=$((failed + 1))
    fi
done

echo ""
echo "🎉 PNG download process completed!"
echo "📊 Summary:"
echo "  - Files downloaded: $downloaded"
echo "  - Files failed: $failed"
echo "  - Total unique PNGs found: ${#png_urls[@]}"
echo ""

# Now update all HTML files to reference local PNG files
echo "🔄 Updating HTML files to reference local PNG files..."
html_files_updated=0

while IFS= read -r html_file; do
    echo "  📄 Updating: $html_file"
    
    # Check if this file contains external PNG URLs
    if grep -q 'https://[^"]*\.png' "$html_file"; then
        # Update the file to reference local assets
        sed -i '' 's|https://[^"]*\.png|assets/images/|g' "$html_file"
        
        # Verify the update
        if ! grep -q 'https://[^"]*\.png' "$html_file"; then
            echo "    ✅ Updated: $html_file"
            html_files_updated=$((html_files_updated + 1))
        else
            echo "    ❌ Failed to update: $html_file"
        fi
    else
        echo "    ⏭️  No external PNG URLs to update in $html_file"
    fi
done <<< "$html_files"

echo ""
echo "🎉 HTML update process completed!"
echo "📊 HTML Update Summary:"
echo "  - HTML files updated: $html_files_updated"
echo "  - Total HTML files processed: $(echo "$html_files" | wc -l)"
echo ""
echo "📁 Files saved to: assets/images/"
echo ""

# List downloaded files
echo "📋 Downloaded files:"
total_pngs=$(ls -la assets/images/*.png 2>/dev/null | wc -l)
echo "  - Total PNG files in assets/images: $total_pngs"
echo ""

# Show some examples of downloaded files
echo "📋 Sample of downloaded files:"
ls -la assets/images/*.png 2>/dev/null | head -10

echo ""
echo "🔍 Verification: Checking if any external PNG URLs remain..."
remaining_external=$(grep -r 'https://[^"]*\.png' . --exclude="download_pngs.sh" 2>/dev/null | wc -l)

if [ "$remaining_external" -eq 0 ]; then
    echo "✅ All external PNG URLs have been successfully updated to local references!"
else
    echo "⚠️  Found $remaining_external remaining external PNG URLs:"
    grep -r 'https://[^"]*\.png' . --exclude="download_pngs.sh" 2>/dev/null | head -5
fi

echo ""
echo "✨ Script completed successfully!"
