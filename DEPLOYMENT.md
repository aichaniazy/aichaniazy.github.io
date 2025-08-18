# Deployment Guide

## Quick Start

1. **Create GitHub Repository**
   - Go to GitHub and create a new repository
   - Name it something like `aicha-niazy-portfolio` or `portfolio-website`
   - Make it public (required for GitHub Pages)

2. **Upload Website Files**
   - Clone the repository to your local machine
   - Copy all contents from the `website/` folder to the repository root
   - Commit and push the files

3. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Source: "Deploy from a branch"
   - Branch: `main` (or `master`)
   - Folder: `/ (root)`
   - Click Save

4. **Custom Domain Setup**
   - In the same Pages settings, add your custom domain: `www.aichaniazy.com`
   - Check "Enforce HTTPS" if available
   - Save the settings

5. **DNS Configuration**
   - Go to your domain registrar's DNS settings
   - Add a CNAME record:
     - Name: `www`
     - Value: `yourusername.github.io`
   - Or add A records pointing to GitHub Pages IPs:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`

6. **Wait for Propagation**
   - DNS changes can take up to 24 hours
   - GitHub Pages will show a warning until DNS is configured
   - Once DNS propagates, your site will be live at `https://www.aichaniazy.com`

## Troubleshooting

- **Site not loading**: Check DNS propagation and GitHub Pages status
- **Assets not loading**: Verify all file paths are correct
- **HTTPS issues**: Wait for DNS propagation and check GitHub Pages settings

## Maintenance

- Update content by editing files and pushing to GitHub
- GitHub Pages automatically rebuilds on each push
- Monitor repository for any build errors
