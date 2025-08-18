# Aicha Niazy Portfolio Website

This is a complete static website for Aicha Niazy's portfolio, ready for GitHub Pages deployment.

## Structure

```
website/
├── index.html                    # Main homepage
├── about/index.html              # About page
├── crm/index.html                # CRM case studies
├── design-systems/index.html     # Design systems examples
├── projects/index.html           # Projects showcase
├── projects/motion/index.html    # Motion projects
├── social-media/index.html       # Social media work
├── contact/index.html            # Contact page
├── assets/
│   ├── css/main.css             # Main stylesheet
│   ├── js/                      # JavaScript files
│   │   ├── webflow-main.js
│   │   ├── webflow-schunk1.js
│   │   └── webflow-schunk2.js
│   └── images/                  # All portfolio images
│       ├── logo-main.png
│       ├── favicon.png
│       ├── apple-touch-icon.png
│       ├── uber-crm.gif
│       ├── tiktok-crm.gif
│       ├── spotify-social.gif
│       ├── uber-social.gif
│       ├── myeatpal-craft.gif
│       ├── motion-craft.gif
│       ├── doorways-cairo.gif
│       ├── instagram.png
│       └── linkedin.png
├── README.md                     # This file
└── DEPLOYMENT.md                 # Deployment instructions
```

## Features

- **Complete Portfolio Site** with all sections
- **Responsive Design** optimized for all devices
- **Modern Animations** using GSAP and Webflow
- **Navigation** between all sections
- **Portfolio Showcase** with case studies
- **Contact Information** and social media links
- **Professional Branding** with consistent design

## Pages Overview

1. **Homepage** - Main portfolio introduction and overview
2. **About** - Personal background and expertise
3. **CRM** - Email marketing and CRM case studies
4. **Design Systems** - Design system examples and methodology
5. **Projects** - Creative work and case studies
6. **Motion** - Animation and motion design projects
7. **Social Media** - Social media strategy and content
8. **Contact** - Get in touch and partnership opportunities

## Setup for GitHub Pages

1. **Create GitHub Repository** - Name it something like `aicha-niazy-portfolio`
2. **Push the `website/` folder** to the repository root
3. **Enable GitHub Pages** in repository settings
4. **Add Custom Domain** `www.aichaniazy.com`
5. **Configure DNS** at your domain registrar
6. **Wait for propagation** (up to 24 hours)

## Custom Domain Setup

1. In GitHub Pages settings, add your custom domain: `www.aichaniazy.com`
2. Configure your domain's DNS:
   - Add a CNAME record pointing `www.aichaniazy.com` to `yourusername.github.io`
   - Or add A records pointing to GitHub Pages IP addresses
3. Wait for DNS propagation (can take up to 24 hours)

## Technologies

- HTML5
- CSS3 with custom animations
- JavaScript for interactions
- GSAP for advanced animations
- Webflow-generated responsive design

## Notes

- All internal links have been updated to point to `https://www.aichaniazy.com/`
- All assets are organized for optimal loading
- Navigation between all pages is fully functional
- Ready for static hosting on GitHub Pages
- Complete portfolio with all sections working
