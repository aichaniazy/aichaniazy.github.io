#!/usr/bin/env python3
import re

# Read the HTML file
with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the old paths with new organized asset paths
# Use a broader pattern that catches all variations
old_pattern = r'\./.*?Portfolio_files/'
new_path = './assets/'

# Replace all occurrences
content = re.sub(old_pattern, new_path, content)

# Write back to file
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print('Asset paths updated successfully!')
print(f'Replaced old Portfolio_files paths with {new_path}')

# Verify the replacement
remaining_old_paths = re.findall(r'\./.*Portfolio_files/', content)
if remaining_old_paths:
    print(f'Warning: {len(remaining_old_paths)} old paths may still exist')
    print('Remaining patterns:', remaining_old_paths[:3])
else:
    print('All old paths have been replaced successfully!')
