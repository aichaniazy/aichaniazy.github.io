#!/bin/bash

# Script to replace all instances of "https://aicha-niazy-portfolio.webflow.io/" 
# with "https://www.aichaniazy.com/" throughout the repository

echo "🔍 Starting URL replacement process..."
echo "📁 Working directory: $(pwd)"
echo ""

# Count total files to process
total_files=$(find . -type f -name "*.html" -o -name "*.css" -o -name "*.js" -o -name "*.md" | wc -l)
echo "📊 Total files to process: $total_files"

# Initialize counters
processed_files=0
modified_files=0
total_replacements=0

# Process all HTML, CSS, JS, and MD files
find . -type f \( -name "*.html" -o -name "*.css" -o -name "*.js" -o -name "*.md" \) | while read -r file; do
    processed_files=$((processed_files + 1))
    
    # Skip the script itself
    if [[ "$file" == "./replace_urls.sh" ]]; then
        continue
    fi
    
    echo "🔄 Processing: $file"
    
    # Check if file contains the old URL
    if grep -q "aicha-niazy-portfolio.webflow.io" "$file"; then
        # Count occurrences before replacement
        occurrences=$(grep -o "aicha-niazy-portfolio.webflow.io" "$file" | wc -l)
        
        # Perform the replacement using macOS-compatible sed
        sed -i '' 's|aicha-niazy-portfolio.webflow.io|www.aichaniazy.com|g' "$file"
        
        # Verify replacement
        if ! grep -q "aicha-niazy-portfolio.webflow.io" "$file"; then
            modified_files=$((modified_files + 1))
            total_replacements=$((total_replacements + occurrences))
            echo "  ✅ Modified: $file ($occurrences replacements)"
        else
            echo "  ❌ Failed to replace in: $file"
        fi
    else
        echo "  ⏭️  No changes needed: $file"
    fi
    
    # Progress indicator
    if [ $((processed_files % 10)) -eq 0 ]; then
        echo "📈 Progress: $processed_files/$total_files files processed"
    fi
done

echo ""
echo "🎉 URL replacement process completed!"
echo "📊 Summary:"
echo "  - Files processed: $processed_files"
echo "  - Files modified: $modified_files"
echo "  - Total replacements: $total_replacements"
echo ""
echo "🔍 Verification: Checking for any remaining old URLs..."
remaining=$(grep -r "aicha-niazy-portfolio.webflow.io" . --exclude="replace_urls.sh" 2>/dev/null | wc -l)

if [ "$remaining" -eq 0 ]; then
    echo "✅ All old URLs have been successfully replaced!"
else
    echo "⚠️  Found $remaining remaining instances of old URLs:"
    grep -r "aicha-niazy-portfolio.webflow.io" . --exclude="replace_urls.sh" 2>/dev/null | head -5
fi

echo ""
echo "✨ Script completed successfully!"
